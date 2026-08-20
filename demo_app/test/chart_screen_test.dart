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

  /// Taps [finder], making sure it is not hidden behind the sticky header.
  ///
  /// [WidgetTester.ensureVisible] can align the target with the top edge of
  /// the scroll view, underneath the header, where taps do not reach it.
  Future<void> tapClearOfHeader(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();

    if (tester.getCenter(finder).dy < 120.0) {
      await tester.drag(find.byType(Scrollable).first, const Offset(0.0, 120.0));
      await tester.pumpAndSettle();
    }

    await tester.tap(finder);
  }

  testWidgets('chart demo screen renders and reacts to its controls', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<YgAppState>(
        create: (BuildContext context) => YgAppState(),
        child: MaterialApp(
          theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
          home: const ChartScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(YgChart), findsNWidgets(6));

    // Switch the size of the first chart.
    await tapClearOfHeader(tester, find.text('large'));
    await tester.pumpAndSettle();

    final Size canvasSize = tester.getSize(
      find
          .descendant(
            of: find.byType(YgChart).first,
            matching: find.byType(CustomPaint),
          )
          .first,
    );
    expect(canvasSize.height, YgChartSize.large.height);

    // Randomize the data of the first chart and let the animation play.
    await tapClearOfHeader(tester, find.text('Randomize data').first);
    await tester.pumpAndSettle();

    // Hide the price series through the legend of the first chart; the
    // tooltip no longer lists it.
    await tapClearOfHeader(tester, find.text('Price').first);
    await tester.pumpAndSettle();

    final Finder chartCanvas = find
        .descendant(
          of: find.byType(YgChart).first,
          matching: find.byType(CustomPaint),
        )
        .first;
    await tester.ensureVisible(chartCanvas);
    await tester.pumpAndSettle();

    TestGesture longPress = await tester.startGesture(tester.getCenter(chartCanvas));
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    await tester.pump();
    expect(find.textContaining('Heating:'), findsOneWidget);
    expect(find.textContaining('Price:'), findsNothing);
    await longPress.up();
    await tester.pumpAndSettle();

    // Toggle it back on; the tooltip lists it again.
    await tapClearOfHeader(tester, find.text('Price').first);
    await tester.pumpAndSettle();

    await tester.ensureVisible(chartCanvas);
    await tester.pumpAndSettle();
    if (tester.getCenter(chartCanvas).dy < 120.0) {
      await tester.drag(find.byType(Scrollable).first, const Offset(0.0, 120.0));
      await tester.pumpAndSettle();
    }

    longPress = await tester.startGesture(tester.getCenter(chartCanvas));
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    await tester.pump();
    expect(find.textContaining('Price:'), findsOneWidget);

    await longPress.up();
    await tester.pumpAndSettle();
    expect(find.textContaining('Heating:'), findsNothing);

    // Tapping the event density rail of the stepped area chart selects a
    // band and the app renders its summary as a list tile below the chart.
    // The rail is the second paint layer of the power chart (the canvas is
    // the first); asserted through the public widget surface only.
    final Finder rail = find
        .descendant(
          of: find.byType(YgChart).at(2),
          matching: find.byType(CustomPaint),
        )
        .at(1);
    await tester.ensureVisible(rail);
    await tester.pumpAndSettle();

    Rect railRect = tester.getRect(rail);
    if (railRect.top < 120.0) {
      await tester.drag(find.byType(Scrollable).first, const Offset(0.0, 120.0));
      await tester.pumpAndSettle();
      railRect = tester.getRect(rail);
    }

    await tester.tapAt(Offset(railRect.left + railRect.width * 0.05, railRect.center.dy));
    await tester.pumpAndSettle();
    expect(find.textContaining('00:00 – 03:00'), findsOneWidget);

    // Dragging along the rail moves the selection to another band.
    final TestGesture railDrag = await tester.startGesture(
      Offset(railRect.left + railRect.width * 0.05, railRect.center.dy),
    );
    await railDrag.moveBy(Offset(railRect.width * 0.5, 0.0));
    await railDrag.up();
    await tester.pumpAndSettle();
    expect(find.textContaining('00:00 – 03:00'), findsNothing);
    expect(find.textContaining('12:00 – 15:00'), findsOneWidget);

    // Long press the temperature band chart: its tooltip shows the average
    // from the chart data plus the raw sensor readings, which only the app
    // knows about.
    final Finder bandCanvas = find
        .descendant(
          of: find.byType(YgChart).at(3),
          matching: find.byType(CustomPaint),
        )
        .first;
    await tester.ensureVisible(bandCanvas);
    await tester.pumpAndSettle();

    final TestGesture bandPress = await tester.startGesture(tester.getCenter(bandCanvas));
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    await tester.pump();
    expect(find.textContaining('Average:'), findsOneWidget);
    expect(find.textContaining('Sensor 1:'), findsOneWidget);
    expect(find.textContaining('Sensor 3:'), findsOneWidget);

    await bandPress.up();
    await tester.pumpAndSettle();
    expect(find.textContaining('Average:'), findsNothing);

    expect(tester.takeException(), isNull);
  });
}
