import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  Future<void> pumpAppBar(WidgetTester tester, YgAppBar appBar) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
        home: Scaffold(appBar: appBar),
      ),
    );
    await tester.pumpAndSettle();
  }

  Finder findIcon(YgIconData icon) {
    return find.byWidgetPredicate(
      (Widget widget) => widget is YgIcon && widget.iconData == icon,
    );
  }

  testWidgets('withButton renders the provided button in the title slot', (WidgetTester tester) async {
    await pumpAppBar(
      tester,
      YgAppBar.withButton(
        titleButton: YgButton(
          onPressed: () {},
          child: const Text('Site name'),
        ),
      ),
    );

    expect(find.byType(YgButton), findsOneWidget);
    expect(find.text('Site name'), findsOneWidget);
  });

  testWidgets('titleButton onPressed fires on tap', (WidgetTester tester) async {
    int tapCount = 0;
    await pumpAppBar(
      tester,
      YgAppBar.withButton(
        titleButton: YgButton(
          onPressed: () => tapCount++,
          child: const Text('Site name'),
        ),
      ),
    );

    await tester.tap(find.byType(YgButton));
    await tester.pumpAndSettle();
    expect(tapCount, 1);
  });

  testWidgets('composed title button fits the title slot', (WidgetTester tester) async {
    await pumpAppBar(
      tester,
      YgAppBar.withButton(
        titleButton: YgButton.leadingIcon(
          onPressed: () {},
          icon: YgIcons.homeAway,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(child: Text('Site name')),
              SizedBox(width: 5.0),
              YgTag(size: YgTagSize.small, child: Text('(2)')),
            ],
          ),
        ),
      ),
    );

    expect(findIcon(YgIcons.homeAway), findsOneWidget);
    expect(find.text('Site name'), findsOneWidget);
    expect(find.text('(2)'), findsOneWidget);
  });

  testWidgets('plain constructor renders a text title and no button', (WidgetTester tester) async {
    await pumpAppBar(
      tester,
      const YgAppBar(title: 'Site name'),
    );

    expect(find.text('Site name'), findsOneWidget);
    expect(find.byType(YgButton), findsNothing);
  });
}
