import 'package:flutter/gestures.dart' show kLongPressTimeout;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_painter.dart';
import 'package:yggdrasil/src/components/yg_chart_container/yg_chart_container_indicator_painter.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  const List<String> dayLabels = <String>['00:00', '06:00', '12:00', '18:00', '24:00'];

  const List<String> hourLabels = <String>[
    '00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', //
    '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',
  ];

  const List<double> powerValues = <double>[
    0.4, 0.3, 0.3, 0.3, 0.4, 0.6, 2.8, 3.4, 2.1, 1.2, 0.8, 0.9, //
    2.5, 1.4, 0.9, 0.8, 1.1, 2.2, 3.0, 3.6, 2.4, 1.3, 0.7, 0.5,
  ];

  const List<YgStateTimelineSeries> modeSeries = <YgStateTimelineSeries>[
    YgStateTimelineSeries(
      id: 'heat',
      label: 'Heat',
      ranges: <YgStateTimelineRange>[
        YgStateTimelineRange(start: 0.0, end: 9.0),
        YgStateTimelineRange(start: 17.0, end: 24.0),
      ],
    ),
    YgStateTimelineSeries(
      id: 'eco',
      label: 'Eco',
      ranges: <YgStateTimelineRange>[
        YgStateTimelineRange(start: 9.0, end: 17.0),
      ],
    ),
  ];

  const List<YgStateTimelineSeries> stateSeries = <YgStateTimelineSeries>[
    YgStateTimelineSeries(
      id: 'idle',
      label: 'Idle',
      ranges: <YgStateTimelineRange>[
        YgStateTimelineRange(start: 0.0, end: 6.0),
        YgStateTimelineRange(start: 9.0, end: 17.0),
        YgStateTimelineRange(start: 20.0, end: 24.0),
      ],
    ),
    YgStateTimelineSeries(
      id: 'heating',
      label: 'Heating',
      ranges: <YgStateTimelineRange>[
        YgStateTimelineRange(start: 6.0, end: 9.0),
        YgStateTimelineRange(start: 17.0, end: 20.0),
      ],
    ),
  ];

  const YgChartContainerChart powerEntry = YgChartContainerChart(
    subtitle: 'Power',
    xLabels: hourLabels,
    series: <YgChartSeries>[
      YgChartSeries(
        id: 'power',
        label: 'Power',
        values: powerValues,
        unit: 'kW',
        type: YgChartSeriesType.line,
      ),
    ],
  );

  const YgChartContainer mixedContainer = YgChartContainer(
    entries: <YgChartContainerEntry>[
      powerEntry,
      YgChartContainerTimeline(subtitle: 'Mode', series: modeSeries),
      YgChartContainerTimeline(subtitle: 'State', series: stateSeries),
    ],
    start: 0.0,
    end: 24.0,
    axisLabels: dayLabels,
  );

  Future<void> pumpContainer(
    WidgetTester tester,
    YgChartContainer container,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
        home: Scaffold(body: container),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// Long presses at [position] and waits for the scrub to show.
  Future<TestGesture> longPressAt(WidgetTester tester, Offset position) async {
    final TestGesture gesture = await tester.startGesture(position);
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    await tester.pump();

    return gesture;
  }

  /// The canvas painter of the chart entry.
  YgChartPainter chartPainterOf(WidgetTester tester) {
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

  /// The capsule handle painters drawn over the timeline entries.
  Finder timelineIndicators() {
    return find.byWidgetPredicate(
      (Widget widget) => widget is CustomPaint && widget.foregroundPainter is YgChartContainerIndicatorPainter,
    );
  }

  testWidgets('renders a subtitle above every entry', (WidgetTester tester) async {
    await pumpContainer(tester, mixedContainer);

    expect(find.byType(YgChart), findsOneWidget);
    expect(find.byType(YgStateTimeline), findsNWidgets(2));
    // The chart legend repeats the series label below the plot.
    expect(find.text('Power'), findsNWidgets(2));
    expect(find.text('Mode'), findsOneWidget);
    expect(find.text('State'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('long pressing shows the values at the pressed moment on every subtitle',
      (WidgetTester tester) async {
    await pumpContainer(tester, mixedContainer);

    // The timelines are inset to the chart plot, so their center is 12:00
    // on the 0..24 span, column 12 of the 24 column chart.
    final TestGesture press = await longPressAt(tester, tester.getCenter(find.byType(YgStateTimeline).first));

    expect(find.textContaining('Power: 2.5 kW'), findsOneWidget);
    expect(find.textContaining('Mode: Eco'), findsOneWidget);
    expect(find.textContaining('State: Idle'), findsOneWidget);

    // Dragging a quarter of the plot to the right scrubs to 18:00; the
    // chart value drops its decimal noise (3.0 -> "3").
    await press.moveBy(Offset(tester.getRect(find.byType(YgStateTimeline).first).width * 0.25, 0.0));
    await tester.pump();

    expect(find.textContaining('Power: 3 kW'), findsOneWidget);
    expect(find.textContaining('Mode: Heat'), findsOneWidget);
    expect(find.textContaining('State: Heating'), findsOneWidget);

    await press.up();
    await tester.pumpAndSettle();
    expect(find.textContaining('Power:'), findsNothing);
    expect(find.textContaining('Mode:'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('draws the scrub indicator on every entry while pressed', (WidgetTester tester) async {
    await pumpContainer(tester, mixedContainer);

    expect(timelineIndicators(), findsNothing);
    expect(chartPainterOf(tester).scrubFraction, isNull);

    final TestGesture press = await longPressAt(tester, tester.getCenter(find.byType(YgStateTimeline).first));

    expect(timelineIndicators(), findsNWidgets(2));
    // The pressed fraction snaps to the center of column 12 of the 24
    // column chart, so chart and timeline indicators share one x.
    expect(chartPainterOf(tester).scrubFraction, moreOrLessEquals(12.5 / 24.0));

    await press.up();
    await tester.pumpAndSettle();
    expect(timelineIndicators(), findsNothing);
    expect(chartPainterOf(tester).scrubFraction, isNull);
  });

  testWidgets('timelines are inset to align with the chart plot', (WidgetTester tester) async {
    await pumpContainer(tester, mixedContainer);

    // The chart canvas spans the full width and reserves a left gutter for
    // its axis labels; the timelines skip that gutter. The power chart has
    // no right axis, so the right edges align at the container edge.
    final Rect chartRect = tester.getRect(find.byType(YgChart));
    final Rect timelineRect = tester.getRect(find.byType(YgStateTimeline).first);
    expect(timelineRect.left, greaterThan(chartRect.left));
    expect(timelineRect.right, chartRect.right);

    // Without chart entries no gutter is reserved.
    await pumpContainer(
      tester,
      const YgChartContainer(
        entries: <YgChartContainerEntry>[
          YgChartContainerTimeline(subtitle: 'Mode', series: modeSeries),
        ],
        start: 0.0,
        end: 24.0,
        axisLabels: dayLabels,
      ),
    );

    final Rect containerRect = tester.getRect(find.byType(YgChartContainer));
    expect(tester.getRect(find.byType(YgStateTimeline)).left, containerRect.left);
  });

  testWidgets('valueBuilder overrides the subtitle value of both entry types', (WidgetTester tester) async {
    await pumpContainer(
      tester,
      YgChartContainer(
        entries: <YgChartContainerEntry>[
          YgChartContainerChart(
            subtitle: 'Power',
            xLabels: powerEntry.xLabels,
            series: powerEntry.series,
            valueBuilder: (int index) => 'column $index',
          ),
          YgChartContainerTimeline(
            subtitle: 'Energy',
            series: modeSeries,
            valueBuilder: (double position) => '${position.toStringAsFixed(1)} h',
          ),
        ],
        start: 0.0,
        end: 24.0,
        axisLabels: dayLabels,
      ),
    );

    final TestGesture press = await longPressAt(tester, tester.getCenter(find.byType(YgStateTimeline)));

    // The pressed moment snaps to the chart column center (12.5 of 24).
    expect(find.textContaining('Power: column 12'), findsOneWidget);
    expect(find.textContaining('Energy: 12.5 h'), findsOneWidget);

    await press.up();
    await tester.pumpAndSettle();
  });

  testWidgets('default chart value skips series hidden through the legend', (WidgetTester tester) async {
    await pumpContainer(tester, mixedContainer);

    // Hide the only series of the power chart through its legend; the
    // subtitle no longer reports a value that has no on-plot mark.
    await tester.tap(find.text('Power').last);
    await tester.pumpAndSettle();

    final TestGesture press = await longPressAt(tester, tester.getCenter(find.byType(YgStateTimeline).first));

    expect(find.textContaining('Power:'), findsNothing);
    expect(find.textContaining('Mode: Eco'), findsOneWidget);

    await press.up();
    await tester.pumpAndSettle();

    // Toggling it back on restores the value.
    await tester.tap(find.text('Power').last);
    await tester.pumpAndSettle();

    final TestGesture secondPress = await longPressAt(tester, tester.getCenter(find.byType(YgStateTimeline).first));
    expect(find.textContaining('Power: 2.5 kW'), findsOneWidget);

    await secondPress.up();
    await tester.pumpAndSettle();
  });

  testWidgets('too many entries trigger an assertion', (WidgetTester tester) async {
    await pumpContainer(
      tester,
      const YgChartContainer(
        entries: <YgChartContainerEntry>[
          YgChartContainerTimeline(subtitle: 'One', series: modeSeries),
          YgChartContainerTimeline(subtitle: 'Two', series: modeSeries),
          YgChartContainerTimeline(subtitle: 'Three', series: modeSeries),
          YgChartContainerTimeline(subtitle: 'Four', series: modeSeries),
        ],
        start: 0.0,
        end: 24.0,
      ),
    );

    expect(tester.takeException(), isAssertionError);
  });

  testWidgets('an empty span triggers an assertion', (WidgetTester tester) async {
    await pumpContainer(
      tester,
      const YgChartContainer(
        entries: <YgChartContainerEntry>[
          YgChartContainerTimeline(subtitle: 'Mode', series: modeSeries),
        ],
        start: 24.0,
        end: 24.0,
      ),
    );

    expect(tester.takeException(), isAssertionError);
  });
}
