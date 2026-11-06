import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
    home: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[child],
      ),
    ),
  );
}

void main() {
  testWidgets('renders nothing when there are no groups', (WidgetTester tester) async {
    await tester.pumpWidget(_wrap(const YgSettingSection(groups: <YgSettingGroup>[])));

    expect(tester.getSize(find.byType(YgSettingSection)).height, 0);
    expect(find.byType(ColoredBox), findsNothing);
  });

  testWidgets('renders nothing when every group is empty', (WidgetTester tester) async {
    await tester.pumpWidget(
      _wrap(
        const YgSettingSection(
          groups: <YgSettingGroup>[
            YgSettingGroup(name: 'First', positions: <Widget>[]),
            YgSettingGroup(positions: <Widget>[]),
          ],
        ),
      ),
    );

    expect(tester.getSize(find.byType(YgSettingSection)).height, 0);
    expect(find.text('FIRST'), findsNothing);
  });

  testWidgets('skips empty groups and separates positions with dividers', (WidgetTester tester) async {
    await tester.pumpWidget(
      _wrap(
        const YgSettingSection(
          groups: <YgSettingGroup>[
            YgSettingGroup(
              name: 'Account',
              positions: <Widget>[
                YgListTile(title: 'One'),
                YgListTile(title: 'Two'),
                YgListTile(title: 'Three'),
              ],
            ),
            YgSettingGroup(name: 'Empty', positions: <Widget>[]),
          ],
        ),
      ),
    );

    expect(find.text('ACCOUNT'), findsOneWidget);
    expect(find.text('EMPTY'), findsNothing);
    expect(find.byType(YgDivider), findsNWidgets(2));
    expect(tester.getSize(find.byType(YgSettingSection)).height, greaterThan(0));
  });
}
