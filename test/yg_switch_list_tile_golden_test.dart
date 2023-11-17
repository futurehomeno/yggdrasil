import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgSwitchListTileGoldenTest',
    () {
      final GoldenTestGroup ygSwitchListTileGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With title and value true',
            child: YgSwitchListTile(
              title: YgGoldenTestValues.shortText,
              onChanged: (_) {},
              value: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title and value false',
            child: YgSwitchListTile(
              title: YgGoldenTestValues.longText,
              onChanged: (_) {},
              value: false,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and value true',
            child: YgSwitchListTile(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
              onChanged: (_) {},
              value: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title, long subtitle and value false',
            child: YgSwitchListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              onChanged: (_) {},
              value: false,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle, subtitleIcon and value true',
            child: YgSwitchListTile(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
              subtitleIcon: const YgIcon(YgIcons.info),
              onChanged: (_) {},
              value: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle, leading widget and value false',
            child: YgSwitchListTile(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidget: const YgIcon(YgIcons.info),
              onChanged: (_) {},
              value: false,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgSwitchListTile - ${themeTestData.themeName}',
          fileName: 'yg_switch_list_tile_${themeTestData.fileName}',
          builder: () => ygSwitchListTileGoldenTestGroup,
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
