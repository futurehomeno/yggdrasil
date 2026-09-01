import 'package:flutter/gestures.dart' show kLongPressTimeout;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_chart_event_rail.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_chart_legend.dart';
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

  const YgChartSeries temperature = YgChartSeries(
    id: 'temperature',
    label: 'Temperature',
    values: <double>[21.5, 22.0, 22.5, 22.0],
    lowerValues: <double>[21.0, 21.5, 22.0, 21.0],
    upperValues: <double>[22.0, 23.0, 23.0, 22.5],
    unit: '°C',
    type: YgChartSeriesType.band,
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
      find
          .descendant(
            of: find.byType(YgChart),
            matching: find.byType(CustomPaint),
          )
          .first,
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

  testWidgets('renders a band series next to other series', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[consumption, temperature],
        xLabels: xLabels,
      ),
    );

    expect(find.text('Temperature'), findsOneWidget);

    final YgChartPainter painter = painterOf(tester);
    expect(painter.dataManager.orderedSeries, hasLength(2));
    expect(
      painter.dataManager.currentLowerValuesOf('temperature'),
      temperature.lowerValues,
    );
    expect(
      painter.dataManager.currentUpperValuesOf('temperature'),
      temperature.upperValues,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('tooltip includes the band bounds of a band series', (WidgetTester tester) async {
    YgChartTooltipData? lastData;

    await pumpChart(
      tester,
      YgChart(
        series: const <YgChartSeries>[consumption, temperature],
        xLabels: xLabels,
        tooltipBuilder: (BuildContext context, YgChartTooltipData data) {
          lastData = data;

          return Text('tooltip-${data.xLabel}');
        },
      ),
    );

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

    final YgChartTooltipData data = lastData!;
    expect(data.entries, hasLength(2));

    // The bar series has no band bounds.
    expect(data.entries[0].lowerValue, isNull);
    expect(data.entries[0].upperValue, isNull);

    expect(data.entries[1].value, temperature.values[data.index]);
    expect(data.entries[1].lowerValue, temperature.lowerValues![data.index]);
    expect(data.entries[1].upperValue, temperature.upperValues![data.index]);

    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('renders a stepped area series next to other series', (WidgetTester tester) async {
    const YgChartSeries power = YgChartSeries(
      id: 'power',
      label: 'Power',
      values: <double>[0.4, 5.2, 1.2, 6.0],
      unit: 'kWh',
      type: YgChartSeriesType.steppedArea,
    );

    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[power, consumption],
        xLabels: xLabels,
      ),
    );

    expect(find.text('Power'), findsOneWidget);

    final YgChartPainter painter = painterOf(tester);
    expect(painter.dataManager.orderedSeries, hasLength(2));
    expect(painter.dataManager.currentValuesOf('power'), power.values);
    // The stepped area anchors the axis at zero.
    expect(painter.dataManager.finalMinOf(YgChartAxis.left), 0.0);
    expect(tester.takeException(), isNull);
  });

  testWidgets('overflowing legend stays on one row and scrolls horizontally', (WidgetTester tester) async {
    await pumpChart(
      tester,
      YgChart(
        size: YgChartSize.xsmall,
        xLabels: xLabels,
        series: <YgChartSeries>[
          for (int i = 0; i < 8; i++)
            YgChartSeries(
              id: 'series-$i',
              label: 'Long series label $i',
              values: const <double>[1.0, 2.0, 3.0, 4.0],
              unit: 'kWh',
              type: YgChartSeriesType.line,
            ),
        ],
      ),
    );

    // All items are on a single row: the legend is no taller than one item.
    expect(tester.getSize(find.byType(YgChartLegend)).height, lessThan(40.0));

    // The last item starts beyond the right edge and can be scrolled into
    // view.
    final Finder lastLabel = find.text('Long series label 7');
    final double lastLabelStart = tester.getTopLeft(lastLabel).dx;
    expect(lastLabelStart, greaterThan(800.0));

    await tester.drag(find.byType(YgChartLegend), const Offset(-400.0, 0.0));
    await tester.pumpAndSettle();
    expect(tester.getTopLeft(lastLabel).dx, lessThan(lastLabelStart));
  });

  testWidgets('event markers render over their columns and report taps', (WidgetTester tester) async {
    final List<YgChartEventMarker> tapped = <YgChartEventMarker>[];

    await pumpChart(
      tester,
      YgChart(
        series: const <YgChartSeries>[consumption],
        xLabels: xLabels,
        eventMarkers: const <YgChartEventMarker>[
          YgChartEventMarker(
            index: 1,
            color: Color(0xffd23d2c),
            icon: YgIcons.alert,
            label: 'Device error',
          ),
          YgChartEventMarker(
            index: 3,
            color: Color(0xff5d7a8a),
            count: 3,
          ),
        ],
        onEventMarkerTap: tapped.add,
      ),
    );

    expect(find.byKey(const ValueKey<String>('YgChartEventMarker-1')), findsOneWidget);
    // The marker without an icon shows its event count.
    expect(find.text('3'), findsOneWidget);

    // The icon marker sits horizontally centered on its column.
    final Rect plotRect = painterOf(tester).layout.plotRect!;
    final double slotWidth = plotRect.width / xLabels.length;
    final Offset canvasTopLeft = tester.getTopLeft(
      find
          .descendant(
            of: find.byType(YgChart),
            matching: find.byType(CustomPaint),
          )
          .first,
    );
    final Offset markerCenter = tester.getCenter(find.byKey(const ValueKey<String>('YgChartEventMarker-1')));
    expect(
      markerCenter.dx - canvasTopLeft.dx,
      closeTo(plotRect.left + 1.5 * slotWidth, 0.001),
    );

    await tester.tap(find.byKey(const ValueKey<String>('YgChartEventMarker-1')));
    await tester.tap(find.byKey(const ValueKey<String>('YgChartEventMarker-3')));

    expect(tapped, hasLength(2));
    expect(tapped[0].index, 1);
    expect(tapped[1].count, 3);
  });

  testWidgets('selected event marker shows a ring around its badge', (WidgetTester tester) async {
    const Color markerColor = Color(0xffd23d2c);

    Future<void> pumpWithSelection(int? selectedIndex) {
      return pumpChart(
        tester,
        YgChart(
          series: const <YgChartSeries>[consumption],
          xLabels: xLabels,
          eventMarkers: const <YgChartEventMarker>[
            YgChartEventMarker(index: 1, color: markerColor, icon: YgIcons.alert),
            YgChartEventMarker(index: 3, color: Color(0xff5d7a8a), count: 3),
          ],
          selectedEventMarkerIndex: selectedIndex,
        ),
      );
    }

    Color ringColorOf(int index) {
      final AnimatedContainer container = tester.widget<AnimatedContainer>(
        find.descendant(
          of: find.byKey(ValueKey<String>('YgChartEventMarker-$index')),
          matching: find.byType(AnimatedContainer),
        ),
      );
      final Border border = (container.decoration! as BoxDecoration).border! as Border;

      return border.top.color;
    }

    await pumpWithSelection(1);
    expect(ringColorOf(1), markerColor);
    expect(ringColorOf(3).a, 0.0);

    // Clearing the selection removes the ring again.
    await pumpWithSelection(null);
    expect(ringColorOf(1).a, 0.0);
  });

  testWidgets('duplicate event marker columns trigger an assertion', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[consumption],
        xLabels: xLabels,
        eventMarkers: <YgChartEventMarker>[
          YgChartEventMarker(index: 1, color: Color(0xffd23d2c)),
          YgChartEventMarker(index: 1, color: Color(0xff5d7a8a)),
        ],
      ),
    );

    expect(tester.takeException(), isAssertionError);
  });

  testWidgets('event rail reserves plot space and reports bands under taps and drags', (WidgetTester tester) async {
    final List<int> selections = <int>[];

    await pumpChart(
      tester,
      YgChart(
        series: const <YgChartSeries>[consumption],
        xLabels: xLabels,
        railEvents: const <YgChartRailEvent>[
          YgChartRailEvent(position: 0.5),
          YgChartRailEvent(position: 1.2, color: Color(0xffd23d2c)),
          YgChartRailEvent(position: 3.7),
        ],
        onRailBandSelected: selections.add,
      ),
    );

    final Finder rail = find.byType(YgChartEventRail);
    expect(rail, findsOneWidget);

    // The plot shrinks to make room for the rail between it and the labels.
    final Rect plotRect = painterOf(tester).layout.plotRect!;
    expect(
      plotRect.bottom,
      YgChartSize.medium.height -
          YgChartPainter.xLabelRowHeight -
          YgChartEventRail.plotSpacing -
          YgChartEventRail.height,
    );

    // Tapping the left edge of the rail selects the first band.
    final Rect railRect = tester.getRect(rail);
    await tester.tapAt(Offset(railRect.left + railRect.width * 0.05, railRect.center.dy));
    await tester.pump();
    expect(selections, <int>[0]);

    // Dragging to the right reports the band under the pointer.
    final TestGesture gesture = await tester.startGesture(
      Offset(railRect.left + railRect.width * 0.05, railRect.center.dy),
    );
    await gesture.moveBy(Offset(railRect.width * 0.9, 0.0));
    await gesture.up();
    await tester.pump();
    expect(selections.last, xLabels.length - 1);
  });

  testWidgets('selected rail band highlights its plot column', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[consumption],
        xLabels: xLabels,
        railEvents: <YgChartRailEvent>[
          YgChartRailEvent(position: 1.2),
        ],
        selectedRailBand: 2,
      ),
    );

    expect(painterOf(tester).highlightedIndex, 2);

    // Without a selection no column is highlighted.
    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[consumption],
        xLabels: xLabels,
        railEvents: <YgChartRailEvent>[
          YgChartRailEvent(position: 1.2),
        ],
      ),
    );

    expect(painterOf(tester).highlightedIndex, isNull);
  });

  testWidgets('rail events outside of the x-axis range trigger an assertion', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[consumption],
        xLabels: xLabels,
        railEvents: <YgChartRailEvent>[
          YgChartRailEvent(position: 99.0),
        ],
      ),
    );

    expect(tester.takeException(), isAssertionError);
  });

  testWidgets('a series removed while hidden comes back visible', (WidgetTester tester) async {
    await pumpChart(
      tester,
      YgChart(
        series: const <YgChartSeries>[consumption, price],
        xLabels: xLabels,
        onSeriesToggled: (YgChartSeries series, bool visible) {},
      ),
    );

    // Hide the price series, then rebuild without it.
    await tester.tap(find.text('Price'));
    await tester.pumpAndSettle();
    await pumpChart(
      tester,
      YgChart(
        series: const <YgChartSeries>[consumption],
        xLabels: xLabels,
        onSeriesToggled: (YgChartSeries series, bool visible) {},
      ),
    );

    // A fresh series with the same id must not inherit the stale hidden
    // state.
    await pumpChart(
      tester,
      YgChart(
        series: const <YgChartSeries>[consumption, price],
        xLabels: xLabels,
        onSeriesToggled: (YgChartSeries series, bool visible) {},
      ),
    );

    expect(
      painterOf(tester).dataManager.orderedSeries.map((YgChartSeries series) => series.id),
      contains('price'),
    );
  });

  testWidgets('a chart with only right axis series draws no left axis', (WidgetTester tester) async {
    await pumpChart(
      tester,
      const YgChart(
        series: <YgChartSeries>[price],
        xLabels: xLabels,
      ),
    );

    final YgChartPainter painter = painterOf(tester);
    expect(painter.leftUnit, isNull);
    // No gutter is reserved for the absent left axis.
    expect(painter.layout.plotRect!.left, 0.0);
    expect(tester.takeException(), isNull);
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
