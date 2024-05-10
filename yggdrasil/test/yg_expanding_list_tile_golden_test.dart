import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgExpandingListTileGoldenTest',
    () {
      final Container child = Container(
        width: 100,
        height: 100,
        color: Colors.green,
      );

      final GoldenTestGroup ygExpandingListTileGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With title',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.shortText,
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.longText,
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'With title and subtitle',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title and long subtitle',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and subtitleIcon',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
              subtitleIcon: const YgIcon(YgIcons.info),
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and 1 supporting widget',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              supportingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and 2 supporting widgets',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              supportingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and leading widget',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and 2 leading widgets',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle, leading and supporting widgets',
            child: YgExpandingListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
              ],
              supportingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with title',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.shortText,
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with long title',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.longText,
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with title and subtitle',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with long title and long subtitle',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with title, subtitle and subtitleIcon',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
              subtitleIcon: const YgIcon(YgIcons.info),
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with title, subtitle and 1 supporting widget',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              supportingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with title, subtitle and 2 supporting widgets',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              supportingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with title, subtitle and leading widget',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with title, subtitle and 2 leading widgets',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded, with title, subtitle, leading and supporting widgets',
            child: YgExpandingListTile(
              initiallyExpanded: true,
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
              ],
              supportingWidgets: const <Widget>[
                YgIcon(YgIcons.info),
              ],
              child: child,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgExpandingListTile - ${themeTestData.themeName}',
          fileName: 'yg_expanding_list_tile_${themeTestData.fileName}',
          builder: () => ygExpandingListTileGoldenTestGroup,
          pumpWidget: (WidgetTester widgetTester, Widget widget) {
            return widgetTester.pumpWidgetWithYgTheme(
              widget: widget,
              ygTheme: themeTestData.theme,
            );
          },
        );
      }
    },
  );
}
