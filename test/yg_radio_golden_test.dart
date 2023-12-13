import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgRadioGoldenTest',
    () {
      final GoldenTestGroup ygRadioGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With selected value',
            child: YgRadio<bool>(
              onChanged: (_) {},
              value: true,
              groupValue: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With unselected value',
            child: YgRadio<bool>(
              onChanged: (_) {},
              value: true,
              groupValue: false,
            ),
          ),
          GoldenTestScenario(
            name: 'With selected value and hasError: true',
            child: YgRadio<bool>(
              onChanged: (_) {},
              value: true,
              groupValue: true,
              hasError: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With unselected value and hasError: true',
            child: YgRadio<bool>(
              onChanged: (_) {},
              value: true,
              groupValue: false,
              hasError: true,
            ),
          ),
          GoldenTestScenario(
            name: 'Disabled with selected value',
            child: const YgRadio<bool>(
              onChanged: null,
              value: true,
              groupValue: true,
            ),
          ),
          GoldenTestScenario(
            name: 'Disabled with unselected value',
            child: const YgRadio<bool>(
              onChanged: null,
              value: true,
              groupValue: false,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgRadio - ${themeTestData.themeName}',
          fileName: 'yg_radio_${themeTestData.fileName}',
          builder: () => ygRadioGoldenTestGroup,
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
