import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/widgets/yg_state_timeline_legend.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/yg_state_timeline_painter.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  const List<String> dayLabels = <String>['00:00', '06:00', '12:00', '18:00', '24:00'];

  const YgStateTimelineSeries heat = YgStateTimelineSeries(
    id: 'heat',
    label: 'Heat',
    ranges: <YgStateTimelineRange>[
      YgStateTimelineRange(start: 0.0, end: 6.0),
      YgStateTimelineRange(start: 13.0, end: 18.0),
    ],
  );

  const YgStateTimelineSeries cool = YgStateTimelineSeries(
    id: 'cool',
    label: 'Cool',
    ranges: <YgStateTimelineRange>[
      YgStateTimelineRange(start: 8.0, end: 11.5),
    ],
  );

  const YgStateTimelineSeries idle = YgStateTimelineSeries(
    id: 'idle',
    label: 'Idle',
    color: Color(0xff9e9e9e),
    ranges: <YgStateTimelineRange>[
      YgStateTimelineRange(start: 6.0, end: 8.0),
      YgStateTimelineRange(start: 18.0, end: 22.0),
    ],
  );

  Future<void> pumpTimeline(
    WidgetTester tester,
    YgStateTimeline timeline,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
        home: Scaffold(body: Center(child: timeline)),
      ),
    );
    await tester.pumpAndSettle();
  }

  YgStateTimelinePainter painterOf(WidgetTester tester) {
    final CustomPaint customPaint = tester.widget<CustomPaint>(
      find.descendant(
        of: find.byType(YgStateTimeline),
        matching: find.byType(CustomPaint),
      ),
    );

    return customPaint.painter! as YgStateTimelinePainter;
  }

  testWidgets('renders the bar with a legend', (WidgetTester tester) async {
    await pumpTimeline(
      tester,
      const YgStateTimeline(
        series: <YgStateTimelineSeries>[heat, cool, idle],
        start: 0.0,
        end: 24.0,
        axisLabels: dayLabels,
      ),
    );

    expect(find.byType(YgStateTimeline), findsOneWidget);
    expect(find.text('Heat'), findsOneWidget);
    expect(find.text('Cool'), findsOneWidget);
    expect(find.text('Idle'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('assigns colors from the categorical palette when none is given', (WidgetTester tester) async {
    await pumpTimeline(
      tester,
      const YgStateTimeline(
        series: <YgStateTimelineSeries>[heat, cool, idle],
        start: 0.0,
        end: 24.0,
      ),
    );

    final List<YgStateTimelineSeries> series = painterOf(tester).series;
    expect(series[0].color, YgChartColors.categoricalLight[0]);
    expect(series[1].color, YgChartColors.categoricalLight[1]);
    // The explicit color is kept and does not consume a palette slot.
    expect(series[2].color, const Color(0xff9e9e9e));
  });

  testWidgets('canvas height follows the size and the axis label row', (WidgetTester tester) async {
    await pumpTimeline(
      tester,
      const YgStateTimeline(
        series: <YgStateTimelineSeries>[heat],
        start: 0.0,
        end: 24.0,
        axisLabels: dayLabels,
        size: YgStateTimelineSize.medium,
      ),
    );

    Size canvasSize = tester.getSize(
      find.descendant(
        of: find.byType(YgStateTimeline),
        matching: find.byType(CustomPaint),
      ),
    );
    expect(canvasSize.height, 32.0 + YgStateTimelinePainter.axisLabelRowHeight);

    // Without axis labels the canvas is just the bar.
    await pumpTimeline(
      tester,
      const YgStateTimeline(
        series: <YgStateTimelineSeries>[heat],
        start: 0.0,
        end: 24.0,
      ),
    );

    canvasSize = tester.getSize(
      find.descendant(
        of: find.byType(YgStateTimeline),
        matching: find.byType(CustomPaint),
      ),
    );
    expect(canvasSize.height, 20.0);
  });

  testWidgets('legend can be disabled', (WidgetTester tester) async {
    await pumpTimeline(
      tester,
      const YgStateTimeline(
        series: <YgStateTimelineSeries>[heat],
        start: 0.0,
        end: 24.0,
        showLegend: false,
      ),
    );

    expect(find.text('Heat'), findsNothing);
    expect(find.byType(YgStateTimelineLegend), findsNothing);
  });

  testWidgets('overflowing legend stays on one row and scrolls horizontally', (WidgetTester tester) async {
    await pumpTimeline(
      tester,
      YgStateTimeline(
        start: 0.0,
        end: 24.0,
        series: <YgStateTimelineSeries>[
          for (int i = 0; i < 8; i++)
            YgStateTimelineSeries(
              id: 'state-$i',
              label: 'Long state label $i',
              ranges: <YgStateTimelineRange>[
                YgStateTimelineRange(start: i * 3.0, end: i * 3.0 + 3.0),
              ],
            ),
        ],
      ),
    );

    // All items are on a single row: the legend is no taller than one item.
    expect(tester.getSize(find.byType(YgStateTimelineLegend)).height, lessThan(40.0));

    final Finder lastLabel = find.text('Long state label 7');
    final double lastLabelStart = tester.getTopLeft(lastLabel).dx;
    expect(lastLabelStart, greaterThan(800.0));

    await tester.drag(find.byType(YgStateTimelineLegend), const Offset(-400.0, 0.0));
    await tester.pumpAndSettle();
    expect(tester.getTopLeft(lastLabel).dx, lessThan(lastLabelStart));
  });

  testWidgets('duplicate series ids trigger an assertion', (WidgetTester tester) async {
    await pumpTimeline(
      tester,
      const YgStateTimeline(
        series: <YgStateTimelineSeries>[heat, heat],
        start: 0.0,
        end: 24.0,
      ),
    );

    expect(tester.takeException(), isAssertionError);
  });
}
