import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgListTileGoldenTest',
    () {
      final GoldenTestGroup ygListTileGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With title',
            child: const YgListTile(
              title: YgGoldenTestValues.shortText,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title',
            child: const YgListTile(
              title: YgGoldenTestValues.longText,
            ),
          ),
          GoldenTestScenario(
            name: 'With title and subtitle',
            child: const YgListTile(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title and long subtitle',
            child: const YgListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and subtitleIcon',
            child: const YgListTile(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
              subtitleIcon: YgIcon(YgIcons.info),
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and 1 supporting widget',
            child: const YgListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              supportingWidgets: <Widget>[
                YgIcon(YgIcons.info),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and 2 supporting widgets',
            child: const YgListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              supportingWidgets: <Widget>[
                YgIcon(YgIcons.info),
                YgIcon(YgIcons.info),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and leading widget',
            child: const YgListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidgets: <Widget>[
                YgIcon(YgIcons.info),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and 2 leading widgets',
            child: const YgListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidgets: <Widget>[
                YgIcon(YgIcons.info),
                YgIcon(YgIcons.info),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and trailing widget',
            child: const YgListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              trailingWidgets: <Widget>[
                YgIcon(YgIcons.info),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and 2 trailing widgets',
            child: const YgListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              trailingWidgets: <Widget>[
                YgIcon(YgIcons.info),
                YgIcon(YgIcons.info),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle, leading, trailing and supporting widgets',
            child: const YgListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidgets: <Widget>[
                YgIcon(YgIcons.info),
              ],
              trailingWidgets: <Widget>[
                YgIcon(YgIcons.info),
              ],
              supportingWidgets: <Widget>[
                YgIcon(YgIcons.info),
              ],
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgListTile - ${themeTestData.themeName}',
          fileName: 'yg_list_tile_${themeTestData.fileName}',
          builder: () => ygListTileGoldenTestGroup,
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
