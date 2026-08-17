import 'package:flutter/gestures.dart' show kLongPressTimeout;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_painter.dart';
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

  YgChartPainter firstChartPainter(WidgetTester tester) {
    final CustomPaint customPaint = tester.widget<CustomPaint>(
      find
          .descendant(
            of: find.byType(YgChart).first,
            matching: find.byType(CustomPaint),
          )
          .first,
    );

    return customPaint.painter! as YgChartPainter;
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

    expect(find.byType(YgChart), findsNWidgets(4));

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

    // Toggle the price series through the legend of the first chart.
    await tapClearOfHeader(tester, find.text('Price').first);
    await tester.pumpAndSettle();
    expect(
      firstChartPainter(tester).dataManager.orderedSeries.map((YgChartSeries series) => series.id),
      isNot(contains('price')),
    );

    // Toggle it back on.
    await tapClearOfHeader(tester, find.text('Price').first);
    await tester.pumpAndSettle();
    expect(
      firstChartPainter(tester).dataManager.orderedSeries.map((YgChartSeries series) => series.id),
      contains('price'),
    );

    // Long press the first chart to show its tooltip.
    final Finder chartCanvas = find
        .descendant(
          of: find.byType(YgChart).first,
          matching: find.byType(CustomPaint),
        )
        .first;
    await tester.ensureVisible(chartCanvas);
    await tester.pumpAndSettle();

    final TestGesture longPress = await tester.startGesture(tester.getCenter(chartCanvas));
    await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
    await tester.pump();
    expect(find.textContaining('Heating:'), findsOneWidget);

    await longPress.up();
    await tester.pumpAndSettle();
    expect(find.textContaining('Heating:'), findsNothing);

    expect(tester.takeException(), isNull);
  });
}
