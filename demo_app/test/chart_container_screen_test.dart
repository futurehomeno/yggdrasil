import 'package:flutter/gestures.dart' show kLongPressTimeout;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/_screens.dart';

void main() {
  setUpAll(() {
    if (!sl.isRegistered<YgRouter>()) {
      sl.registerSingleton(const YgRouter());
    }
  });

  /// Scrolls [finder] into view, clear of the sticky header.
  Future<void> makeVisible(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();

    if (tester.getCenter(finder).dy < 120.0) {
      await tester.drag(find.byType(Scrollable).first, const Offset(0.0, 120.0));
      await tester.pumpAndSettle();
    }
  }

  testWidgets('chart container demo screen scrubs charts and timelines together', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<YgAppState>(
        create: (BuildContext context) => YgAppState(),
        child: MaterialApp(
          theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
          home: const ChartContainerScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(YgChartContainer), findsNWidgets(3));
    expect(find.byType(YgChart), findsOneWidget);
    expect(find.byType(YgStateTimeline), findsNWidgets(6));

    // No values are shown next to the subtitles while idle.
    expect(find.textContaining('Power:'), findsNothing);
    expect(find.textContaining('State:'), findsNothing);
    expect(find.textContaining('kWh'), findsNothing);

    // The timelines of the mixed container are inset to align with the
    // chart plot, which reserves a left gutter for its axis labels.
    final Rect chartRect = tester.getRect(find.byType(YgChart));
    final Rect mixedTimelineRect = tester.getRect(find.byType(YgStateTimeline).first);
    expect(mixedTimelineRect.left, greaterThan(chartRect.left));

    // Long press the center of the first timeline of the mixed container:
    // 12:00 on the 0..24 span, column 12 of the 24 column power chart.
    final Finder mixedTimeline = find.byType(YgStateTimeline).first;
    await makeVisible(tester, mixedTimeline);

    final TestGesture press = await tester.startGesture(tester.getCenter(mixedTimeline));
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    await tester.pump();

    expect(find.textContaining('Power: 2.5 kW'), findsOneWidget);
    expect(find.textContaining('Mode: Eco'), findsOneWidget);
    expect(find.textContaining('State: Idle'), findsOneWidget);

    // Scrubbing to the right updates all values (18:00: evening peak,
    // heating in heat mode).
    await press.moveBy(Offset(tester.getRect(mixedTimeline).width * 0.25, 0.0));
    await tester.pump();

    expect(find.textContaining('Power: 3 kW'), findsOneWidget);
    expect(find.textContaining('Mode: Heat'), findsOneWidget);
    expect(find.textContaining('State: Heating'), findsOneWidget);

    // Releasing clears the values again.
    await press.up();
    await tester.pumpAndSettle();
    expect(find.textContaining('Power:'), findsNothing);
    expect(find.textContaining('State:'), findsNothing);

    // The timeline-only container scrubs independently; the energy value
    // comes from the valueBuilder of the entry.
    final Finder secondContainerTimeline = find.byType(YgStateTimeline).at(2);
    await makeVisible(tester, secondContainerTimeline);

    final TestGesture secondPress = await tester.startGesture(tester.getCenter(secondContainerTimeline));
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    await tester.pump();

    expect(find.textContaining('State: Idle'), findsOneWidget);
    expect(find.textContaining('Mode: Eco'), findsOneWidget);
    expect(find.textContaining('Energy consumption: 6.0 kWh'), findsOneWidget);
    expect(find.textContaining('Power:'), findsNothing);

    await secondPress.up();
    await tester.pumpAndSettle();
    expect(find.textContaining('kWh'), findsNothing);

    expect(tester.takeException(), isNull);
  });
}
