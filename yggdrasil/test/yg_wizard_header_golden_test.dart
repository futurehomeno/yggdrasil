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
          for (int steps = 2; steps <= 6; steps++)
            for (int currentStep = 0; currentStep <= steps - 1; currentStep++) ...<GoldenTestScenario>[
              GoldenTestScenario(
                name: 'With short title, step $currentStep of $steps',
                child: YgWizardHeader(
                  currentStep: currentStep,
                  steps: steps,
                  titleBuilder: (_) => YgGoldenTestValues.shortText,
                ),
              ),
              GoldenTestScenario(
                name: 'With long title, step $currentStep of $steps',
                child: YgWizardHeader(
                  currentStep: currentStep,
                  steps: steps,
                  titleBuilder: (_) => YgGoldenTestValues.longText,
                ),
              ),
            ],
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgWizardHeader - ${themeTestData.themeName}',
          fileName: 'yg_wizard_header_${themeTestData.fileName}',
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
