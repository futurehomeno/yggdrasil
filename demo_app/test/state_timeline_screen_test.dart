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

  testWidgets('state timeline demo screen renders and randomizes', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<YgAppState>(
        create: (BuildContext context) => YgAppState(),
        child: MaterialApp(
          theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
          home: const StateTimelineScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(YgStateTimeline), findsNWidgets(3));
    expect(find.text('Heat'), findsOneWidget);
    expect(find.text('Boost'), findsOneWidget);
    // The no-legend timeline does not show its state labels.
    expect(find.text('On'), findsNothing);

    await tester.ensureVisible(find.text('Randomize data'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Randomize data'));
    await tester.pumpAndSettle();

    expect(find.byType(YgStateTimeline), findsNWidgets(3));
    expect(tester.takeException(), isNull);
  });
}
