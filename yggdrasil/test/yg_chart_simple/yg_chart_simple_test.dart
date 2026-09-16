import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/components/yg_chart_simple/yg_chart_simple_painter.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  const YgChartSeries temperature = YgChartSeries(
    id: 'temperature',
    label: 'Temperature',
    values: <double>[20.5, 20.8, 21.2, 21.9, 22.4, 22.5],
    unit: '°C',
    type: YgChartSeriesType.line,
  );

  const YgChartSeries temperatureBand = YgChartSeries(
    id: 'temperature-band',
    label: 'Temperature band',
    values: <double>[21.5, 22.0, 22.5, 22.0, 21.5, 21.0],
    lowerValues: <double>[21.0, 21.5, 22.0, 21.5, 21.0, 20.5],
    upperValues: <double>[22.0, 22.5, 23.0, 22.5, 22.0, 21.5],
    unit: '°C',
    type: YgChartSeriesType.band,
  );

  Future<void> pumpChart(
    WidgetTester tester,
    YgChartSimple chart,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
        home: Scaffold(body: Center(child: chart)),
      ),
    );
    await tester.pumpAndSettle();
  }

  YgChartSimplePainter painterOf(WidgetTester tester) {
    final CustomPaint customPaint = tester.widget<CustomPaint>(
      find
          .descendant(
            of: find.byType(YgChartSimple),
            matching: find.byType(CustomPaint),
          )
          .first,
    );

    return customPaint.painter! as YgChartSimplePainter;
  }

  testWidgets('renders line and band series with the label', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChartSimple(
        label: Text('Last 12 h'),
        series: <YgChartSeries>[temperature, temperatureBand],
      ),
    );

    expect(find.byType(YgChartSimple), findsOneWidget);
    expect(find.text('Last 12 h'), findsOneWidget);

    final YgChartSimplePainter painter = painterOf(tester);
    expect(painter.series, hasLength(2));
  });

  testWidgets('renders no text without a label', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChartSimple(
        series: <YgChartSeries>[temperature],
      ),
    );

    expect(
      find.descendant(
        of: find.byType(YgChartSimple),
        matching: find.byType(Text),
      ),
      findsNothing,
    );
  });

  testWidgets('renders any widget as the label', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChartSimple(
        label: YgTag(
          variant: YgTagVariant.warning,
          child: Text('Last 12 h'),
        ),
        series: <YgChartSeries>[temperature],
      ),
    );

    expect(
      find.descendant(
        of: find.byType(YgChartSimple),
        matching: find.byType(YgTag),
      ),
      findsOneWidget,
    );
    expect(find.text('Last 12 h'), findsOneWidget);
  });

  testWidgets('canvas height follows the size', (WidgetTester tester) async {
    for (final YgChartSize size in YgChartSize.values) {
      await pumpChart(
        tester,
        YgChartSimple(
          series: const <YgChartSeries>[temperature],
          size: size,
        ),
      );

      final Size paintSize = tester.getSize(
        find.descendant(
          of: find.byType(YgChartSimple),
          matching: find.byType(CustomPaint),
        ),
      );
      expect(paintSize.height, size.height);
    }
  });

  testWidgets('assigns colors from the categorical palette when none is given', (WidgetTester tester) async {
    const Color explicitColor = Color(0xff123456);

    await pumpChart(
      tester,
      const YgChartSimple(
        series: <YgChartSeries>[
          temperature,
          YgChartSeries(
            id: 'explicit',
            label: 'Explicit',
            values: <double>[1.0, 2.0, 3.0, 4.0, 5.0, 6.0],
            unit: '°C',
            type: YgChartSeriesType.line,
            color: explicitColor,
          ),
          temperatureBand,
        ],
      ),
    );

    final YgChartSimplePainter painter = painterOf(tester);
    const List<Color> palette = YgChartColors.categoricalLight;
    expect(painter.series[0].color, palette[0]);
    expect(painter.series[1].color, explicitColor);
    expect(painter.series[2].color, palette[1]);
  });

  testWidgets('passes the reference value and range snap to the painter', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChartSimple(
        referenceValue: 21.0,
        series: <YgChartSeries>[temperature],
      ),
    );

    YgChartSimplePainter painter = painterOf(tester);
    expect(painter.referenceValue, 21.0);
    expect(painter.rangeSnap, 5.0, reason: 'the range is snapped to multiples of 5 by default');

    await pumpChart(
      tester,
      const YgChartSimple(
        rangeSnap: null,
        series: <YgChartSeries>[temperature],
      ),
    );

    painter = painterOf(tester);
    expect(painter.rangeSnap, isNull);
  });

  group('resolveRange', () {
    ({double min, double max})? resolveRange({
      List<YgChartSeries> series = const <YgChartSeries>[temperature],
      double? referenceValue,
      double? rangeSnap,
    }) {
      return YgChartSimplePainter.resolveRange(
        series: series,
        referenceValue: referenceValue,
        rangeSnap: rangeSnap,
      );
    }

    test('snaps the bounds outwards to multiples of the range snap', () {
      // The temperature values span 20.5..22.5.
      expect(resolveRange(rangeSnap: 10.0), (min: 20.0, max: 30.0));
      expect(resolveRange(rangeSnap: 5.0), (min: 20.0, max: 25.0));
    });

    test('hugs the data without a range snap', () {
      expect(resolveRange(), (min: 20.5, max: 22.5));
    });

    test('includes band bounds and the reference value', () {
      expect(
        resolveRange(series: <YgChartSeries>[temperature, temperatureBand], rangeSnap: 10.0),
        (min: 20.0, max: 30.0),
      );
      expect(resolveRange(referenceValue: 31.0, rangeSnap: 10.0), (min: 20.0, max: 40.0));
      expect(resolveRange(referenceValue: 19.0), (min: 19.0, max: 22.5));
    });

    test('expands flat data before snapping', () {
      const YgChartSeries flat = YgChartSeries(
        id: 'flat',
        label: 'Flat',
        values: <double>[20.0, 20.0],
        unit: '°C',
        type: YgChartSeriesType.line,
      );

      expect(resolveRange(series: <YgChartSeries>[flat]), (min: 19.5, max: 20.5));
      expect(resolveRange(series: <YgChartSeries>[flat], rangeSnap: 10.0), (min: 10.0, max: 30.0));
    });

    test('does not extend a scale of non-negative data below zero', () {
      const YgChartSeries nearZero = YgChartSeries(
        id: 'near-zero',
        label: 'Near zero',
        values: <double>[0.3, 0.3],
        unit: 'kW',
        type: YgChartSeriesType.line,
      );
      expect(resolveRange(series: <YgChartSeries>[nearZero], rangeSnap: 10.0), (min: 0.0, max: 10.0));

      const YgChartSeries negative = YgChartSeries(
        id: 'negative',
        label: 'Negative',
        values: <double>[-5.0, 5.0],
        unit: '°C',
        type: YgChartSeriesType.line,
      );
      expect(resolveRange(series: <YgChartSeries>[negative], rangeSnap: 10.0), (min: -10.0, max: 10.0));
    });

    test('resolves no range without finite values', () {
      expect(resolveRange(series: const <YgChartSeries>[]), isNull);
      expect(
        resolveRange(
          series: const <YgChartSeries>[
            YgChartSeries(
              id: 'gaps',
              label: 'Gaps',
              values: <double>[double.nan, double.nan],
              unit: '°C',
              type: YgChartSeriesType.line,
            ),
          ],
        ),
        isNull,
      );
    });
  });

  testWidgets('renders gaps, flat data and a single value without exceptions', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChartSimple(
        label: Text('Last 12 h'),
        referenceValue: 21.0,
        series: <YgChartSeries>[
          YgChartSeries(
            id: 'gaps',
            label: 'Gaps',
            values: <double>[20.5, double.nan, 21.2, double.nan, double.nan, 22.5],
            unit: '°C',
            type: YgChartSeriesType.line,
          ),
          YgChartSeries(
            id: 'band-gaps',
            label: 'Band gaps',
            values: <double>[21.5, 22.0, double.nan, 22.0, 21.5, 21.0],
            lowerValues: <double>[21.0, 21.5, double.nan, 21.5, 21.0, 20.5],
            upperValues: <double>[22.0, 22.5, double.nan, 22.5, 22.0, 21.5],
            unit: '°C',
            type: YgChartSeriesType.band,
          ),
        ],
      ),
    );
    expect(tester.takeException(), isNull);

    await pumpChart(
      tester,
      const YgChartSimple(
        series: <YgChartSeries>[
          YgChartSeries(
            id: 'flat',
            label: 'Flat',
            values: <double>[21.0, 21.0, 21.0, 21.0],
            unit: '°C',
            type: YgChartSeriesType.line,
          ),
        ],
      ),
    );
    expect(tester.takeException(), isNull);

    await pumpChart(
      tester,
      const YgChartSimple(
        series: <YgChartSeries>[
          YgChartSeries(
            id: 'single',
            label: 'Single',
            values: <double>[21.0],
            unit: '°C',
            type: YgChartSeriesType.line,
          ),
        ],
      ),
    );
    expect(tester.takeException(), isNull);

    await pumpChart(
      tester,
      const YgChartSimple(series: <YgChartSeries>[]),
    );
    expect(tester.takeException(), isNull);
  });

  Future<void> pumpWithoutSettling(WidgetTester tester, YgChartSimple chart) {
    return tester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
        home: Scaffold(body: Center(child: chart)),
      ),
    );
  }

  testWidgets('rejects unsupported series types', (WidgetTester tester) async {
    await pumpWithoutSettling(
      tester,
      const YgChartSimple(
        series: <YgChartSeries>[
          YgChartSeries(
            id: 'bars',
            label: 'Bars',
            values: <double>[1.0, 2.0, 3.0],
            unit: 'kWh',
          ),
        ],
      ),
    );

    expect(tester.takeException(), isAssertionError);
  });

  testWidgets('rejects series of different lengths', (WidgetTester tester) async {
    await pumpWithoutSettling(
      tester,
      const YgChartSimple(
        series: <YgChartSeries>[
          temperature,
          YgChartSeries(
            id: 'short',
            label: 'Short',
            values: <double>[1.0, 2.0],
            unit: '°C',
            type: YgChartSeriesType.line,
          ),
        ],
      ),
    );

    expect(tester.takeException(), isAssertionError);
  });
}
