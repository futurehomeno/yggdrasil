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

  testWidgets('tile selector demo screen renders and selects', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<YgAppState>(
        create: (BuildContext context) => YgAppState(),
        child: MaterialApp(
          theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
          home: const TileSelectorScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(YgTileSelector<String>), findsNWidgets(10));

    // Select 'Away' in the small selector at the top of the screen.
    await tester.tap(find.text('Away').first);
    await tester.pumpAndSettle();

    final YgTileSelector<String> smallSelector =
        tester.widgetList<YgTileSelector<String>>(find.byType(YgTileSelector<String>)).first;
    expect(smallSelector.value, 'away');
    expect(tester.takeException(), isNull);
  });
}
