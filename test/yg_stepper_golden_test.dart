import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgStepperGoldenTest',
    () {
      final GoldenTestGroup ygStepperGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'At minimum value',
            child: YgStepper(
              value: 0.0,
              min: 0.0,
              max: 10.0,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'At value between minimum and maximum',
            child: YgStepper(
              value: 5.0,
              min: 0.0,
              max: 10.0,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'At maximum value',
            child: YgStepper(
              value: 10.0,
              min: 0.0,
              max: 10.0,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'With higher precision',
            child: YgStepper(
              value: 5.0,
              min: 0.0,
              max: 10.0,
              precision: 10,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'With short metric',
            child: YgStepper(
              value: 5.0,
              min: 0.0,
              max: 10.0,
              precision: 10,
              metric: YgGoldenTestValues.shortText,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'With long metric',
            child: YgStepper(
              value: 5.0,
              min: 0.0,
              max: 10.0,
              precision: 10,
              metric: YgGoldenTestValues.longText,
              onChanged: (_) {},
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgStepper - ${themeTestData.themeName}',
          fileName: 'yg_stepper_${themeTestData.fileName}',
          builder: () => ygStepperGoldenTestGroup,
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
