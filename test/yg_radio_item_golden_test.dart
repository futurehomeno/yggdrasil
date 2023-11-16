import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgRadioItemGoldenTest',
    () {
      final GoldenTestGroup ygRadioItemGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With selected value and short title',
            child: YgRadioItem<bool>(
              onChanged: (_) {},
              value: true,
              groupValue: true,
              title: YgGoldenTestValues.shortText,
            ),
          ),
          GoldenTestScenario(
            name: 'With unselected value and medium text',
            child: YgRadioItem<bool>(
              onChanged: (_) {},
              value: true,
              groupValue: false,
              title: YgGoldenTestValues.mediumText,
            ),
          ),
          GoldenTestScenario(
            name: 'With selected value and long title',
            child: YgRadioItem<bool>(
              onChanged: (_) {},
              value: true,
              groupValue: true,
              title: YgGoldenTestValues.longText,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgRadioItem - ${themeTestData.themeName}',
          fileName: 'yg_radio_item_${themeTestData.fileName}',
          builder: () => ygRadioItemGoldenTestGroup,
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
