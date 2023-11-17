import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgRadioListTileGoldenTest',
    () {
      final GoldenTestGroup ygRadioListTileGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With title and selected',
            child: YgRadioListTile<bool>(
              title: YgGoldenTestValues.shortText,
              groupValue: true,
              onChanged: (_) {},
              value: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title and unselected',
            child: YgRadioListTile<bool>(
              title: YgGoldenTestValues.longText,
              onChanged: (_) {},
              groupValue: true,
              value: false,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle and selected',
            child: YgRadioListTile<bool>(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
              onChanged: (_) {},
              groupValue: true,
              value: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title, long subtitle and unselected',
            child: YgRadioListTile<bool>(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              onChanged: (_) {},
              value: false,
              groupValue: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle, subtitleIcon and selected',
            child: YgRadioListTile<bool>(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.mediumText,
              subtitleIcon: const YgIcon(YgIcons.info),
              onChanged: (_) {},
              value: true,
              groupValue: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, subtitle, leading widget and unselected',
            child: YgRadioListTile<bool>(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              leadingWidget: const YgIcon(YgIcons.info),
              onChanged: (_) {},
              value: false,
              groupValue: true,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgRadioListTile - ${themeTestData.themeName}',
          fileName: 'yg_radio_list_tile_${themeTestData.fileName}',
          builder: () => ygRadioListTileGoldenTestGroup,
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
