import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgCheckboxGoldenTest',
    () {
      final GoldenTestGroup ygCheckboxGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With value: true',
            child: YgCheckbox(
              onChanged: (_) {},
              value: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With value: false',
            child: YgCheckbox(
              onChanged: (_) {},
              value: false,
            ),
          ),
          GoldenTestScenario(
            name: 'With value: null (triState: true)',
            child: YgCheckbox(
              onChanged: (_) {},
              value: null,
              triState: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With value: true and hasError: true',
            child: YgCheckbox(
              onChanged: (_) {},
              value: true,
              hasError: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With value: false and hasError: true',
            child: YgCheckbox(
              onChanged: (_) {},
              value: false,
              hasError: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With value: null (triState: true) and hasError: true',
            child: YgCheckbox(
              onChanged: (_) {},
              value: null,
              triState: true,
              hasError: true,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgCheckbox - ${themeTestData.themeName}',
          fileName: 'yg_checkbox_${themeTestData.fileName}',
          builder: () => ygCheckboxGoldenTestGroup,
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
