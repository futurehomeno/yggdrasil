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

  testWidgets('setting section demo screen renders groups', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<YgAppState>(
        create: (BuildContext context) => YgAppState(),
        child: MaterialApp(
          theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
          home: const SettingSectionScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(YgSettingSection), findsOneWidget);
    expect(find.text('SUBSCRIPTION'), findsOneWidget);
    expect(find.text('ACCOUNT AND SECURITY'), findsOneWidget);
    expect(find.text('EMPTY GROUP IS NOT RENDERED'), findsNothing);
    // Dividers only between positions: 3 in the account and security group.
    expect(find.byType(YgDivider), findsNWidgets(3));
    expect(tester.takeException(), isNull);
  });
}
