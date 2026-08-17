import 'package:flutter/gestures.dart' show kLongPressTimeout;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_painter.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  const List<String> xLabels = <String>['Mon', 'Tue', 'Wed', 'Thu'];

  const YgChartSeries consumption = YgChartSeries(
    id: 'consumption',
    label: 'Consumption',
    values: <double>[1.0, 2.0, 3.0, 4.0],
    unit: 'kWh',
  );

  const YgChartSeries production = YgChartSeries(
    id: 'production',
    label: 'Production',
    values: <double>[-1.0, -0.5, 0.0, -2.0],
    unit: 'kWh',
  );

  const YgChartSeries price = YgChartSeries(
    id: 'price',
    label: 'Price',
    values: <double>[0.5, 1.5, 1.0, 2.5],
    unit: 'kr',
    type: YgChartSeriesType.line,
    axis: YgChartAxis.right,
  );

  Future<void> pumpChart(
    WidgetTester tester,
    YgChart chart,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
        home: Scaffold(body: Center(child: chart)),
      ),
    );
    await tester.pumpAndSettle();
  }

  YgChartPainter painterOf(WidgetTester tester) {
    final CustomPaint customPaint = tester.widget<CustomPaint>(
      find.descendant(
        of: find.byType(YgChart),
        matching: find.byType(CustomPaint),
      ),
    );

    return customPaint.painter! as YgChartPainter;
  }

  testWidgets('renders bar and line series with a legend', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[consumption, price],
        xLabels: xLabels,
      ),
    );

    expect(find.byType(YgChart), findsOneWidget);
    expect(find.text('Consumption'), findsOneWidget);
    expect(find.text('Price'), findsOneWidget);

    final YgChartPainter painter = painterOf(tester);
    expect(painter.leftUnit, 'kWh');
    expect(painter.rightUnit, 'kr');
    expect(painter.dataManager.orderedSeries, hasLength(2));
  });

  testWidgets('chart canvas height follows the size', (WidgetTester tester) async {
    for (final YgChartSize size in YgChartSize.values) {
      await pumpChart(
        tester,
        YgChart(
          series: const <YgChartSeries>[consumption],
          xLabels: xLabels,
          size: size,
        ),
      );

      final Size paintSize = tester.getSize(
        find.descendant(
          of: find.byType(YgChart),
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
      const YgChart(
        series: <YgChartSeries>[
          consumption,
          YgChartSeries(
            id: 'explicit',
            label: 'Explicit',
            values: <double>[1.0, 1.0, 1.0, 1.0],
            unit: 'kWh',
            color: explicitColor,
          ),
          price,
        ],
        xLabels: xLabels,
      ),
    );

    final List<YgChartSeries> series = painterOf(tester).dataManager.orderedSeries;
    expect(series[0].color, YgChartColors.categoricalLight[0]);
    expect(series[1].color, explicitColor);
    expect(series[2].color, YgChartColors.categoricalLight[1]);
  });

  testWidgets('supports negative values', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[consumption, production],
        xLabels: xLabels,
      ),
    );

    final YgChartPainter painter = painterOf(tester);
    expect(painter.dataManager.finalMinOf(YgChartAxis.left), lessThan(0.0));
    expect(tester.takeException(), isNull);
  });

  testWidgets('tapping the legend hides and shows a series', (WidgetTester tester) async {
    final List<(String, bool)> toggles = <(String, bool)>[];

    await pumpChart(
      tester,
      YgChart(
        series: const <YgChartSeries>[consumption, price],
        xLabels: xLabels,
        onSeriesToggled: (YgChartSeries series, bool visible) => toggles.add((series.id, visible)),
      ),
    );

    await tester.tap(find.text('Price'));
    await tester.pumpAndSettle();

    expect(toggles, <(String, bool)>[('price', false)]);
    // The hidden series has animated out and is no longer tracked.
    expect(
      painterOf(tester).dataManager.orderedSeries.map((YgChartSeries series) => series.id),
      <String>['consumption'],
    );
    // The legend still shows the hidden series so it can be re-enabled.
    expect(find.text('Price'), findsOneWidget);

    await tester.tap(find.text('Price'));
    await tester.pumpAndSettle();

    expect(toggles, <(String, bool)>[('price', false), ('price', true)]);
    expect(painterOf(tester).dataManager.orderedSeries, hasLength(2));
  });

  testWidgets('data updates animate to the new values', (WidgetTester tester) async {
    const YgChartSeries updated = YgChartSeries(
      id: 'consumption',
      label: 'Consumption',
      values: <double>[10.0, 20.0, 30.0, 40.0],
      unit: 'kWh',
    );

    await pumpChart(
      tester,
      const YgChart(series: <YgChartSeries>[consumption], xLabels: xLabels),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
        home: const Scaffold(
          body: Center(
            child: YgChart(series: <YgChartSeries>[updated], xLabels: xLabels),
          ),
        ),
      ),
    );

    // Mid-animation the values are between the old and new ones.
    await tester.pump(const Duration(milliseconds: 100));
    final List<double> midValues = painterOf(tester).dataManager.currentValuesOf('consumption');
    expect(midValues[3], greaterThan(4.0));
    expect(midValues[3], lessThan(40.0));

    await tester.pumpAndSettle();
    expect(
      painterOf(tester).dataManager.currentValuesOf('consumption'),
      <double>[10.0, 20.0, 30.0, 40.0],
    );
  });

  testWidgets('long press shows a tooltip with the exact values', (WidgetTester tester) async {
    YgChartTooltipData? lastData;

    await pumpChart(
      tester,
      YgChart(
        series: const <YgChartSeries>[consumption, price],
        xLabels: xLabels,
        tooltipBuilder: (BuildContext context, YgChartTooltipData data) {
          lastData = data;

          return Text('tooltip-${data.xLabel}');
        },
      ),
    );

    expect(find.textContaining('tooltip-'), findsNothing);

    final Offset center = tester.getCenter(
      find
          .descendant(
            of: find.byType(YgChart),
            matching: find.byType(CustomPaint),
          )
          .first,
    );
    final TestGesture gesture = await tester.startGesture(center);
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    await tester.pump();

    expect(find.textContaining('tooltip-'), findsOneWidget);

    final YgChartTooltipData data = lastData!;
    expect(data.xLabel, xLabels[data.index]);
    expect(data.entries, hasLength(2));
    expect(data.entries[0].value, consumption.values[data.index]);
    expect(data.entries[1].value, price.values[data.index]);
    expect(data.entries[0].series.color, isNotNull);

    // Dragging while pressed moves the selection to a later column.
    await gesture.moveBy(const Offset(200.0, 0.0));
    await tester.pump();
    expect(lastData!.index, greaterThan(data.index));

    // Hidden series are not part of the tooltip.
    expect(
      lastData!.entries.map((YgChartTooltipEntry entry) => entry.series.id),
      contains('price'),
    );

    await gesture.up();
    await tester.pumpAndSettle();
    expect(find.textContaining('tooltip-'), findsNothing);
  });

  testWidgets('tooltip skips series hidden through the legend', (WidgetTester tester) async {
    YgChartTooltipData? lastData;

    await pumpChart(
      tester,
      YgChart(
        series: const <YgChartSeries>[consumption, price],
        xLabels: xLabels,
        tooltipBuilder: (BuildContext context, YgChartTooltipData data) {
          lastData = data;

          return Text('tooltip-${data.xLabel}');
        },
      ),
    );

    await tester.tap(find.text('Price'));
    await tester.pumpAndSettle();

    final Offset center = tester.getCenter(
      find
          .descendant(
            of: find.byType(YgChart),
            matching: find.byType(CustomPaint),
          )
          .first,
    );
    final TestGesture gesture = await tester.startGesture(center);
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    await tester.pump();

    expect(
      lastData!.entries.map((YgChartTooltipEntry entry) => entry.series.id),
      <String>['consumption'],
    );

    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('legend can be disabled', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[consumption],
        xLabels: xLabels,
        showLegend: false,
      ),
    );

    expect(find.text('Consumption'), findsNothing);
  });
}
