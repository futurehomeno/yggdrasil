import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgProgressIndicatorsGoldenTest',
    () {
      final GoldenTestGroup ygProgressIndicatorsGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'Circular progress indicator with 0.0 value',
            child: const YgCircularProgressIndicator(value: 0.0),
          ),
          GoldenTestScenario(
            name: 'Circular progress indicator with 0.25 value',
            child: const YgCircularProgressIndicator(value: 0.25),
          ),
          GoldenTestScenario(
            name: 'Circular progress indicator with 0.5 value',
            child: const YgCircularProgressIndicator(value: 0.5),
          ),
          GoldenTestScenario(
            name: 'Circular progress indicator with 0.75 value',
            child: const YgCircularProgressIndicator(value: 0.75),
          ),
          GoldenTestScenario(
            name: 'Circular progress indicator with 1.0 value',
            child: const YgCircularProgressIndicator(value: 1.0),
          ),
          GoldenTestScenario(
            name: 'Linear progress indicator with 0.0 value',
            child: const YgLinearProgressIndicator(value: 0.0),
          ),
          GoldenTestScenario(
            name: 'Linear progress indicator with 0.25 value',
            child: const YgLinearProgressIndicator(value: 0.25),
          ),
          GoldenTestScenario(
            name: 'Linear progress indicator with 0.5 value',
            child: const YgLinearProgressIndicator(value: 0.5),
          ),
          GoldenTestScenario(
            name: 'Linear progress indicator with 0.75 value',
            child: const YgLinearProgressIndicator(value: 0.75),
          ),
          GoldenTestScenario(
            name: 'Linear progress indicator with 1.0 value',
            child: const YgLinearProgressIndicator(value: 1.0),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgProgressIndicators - ${themeTestData.themeName}',
          fileName: 'yg_progress_indicators_${themeTestData.fileName}',
          builder: () => ygProgressIndicatorsGoldenTestGroup,
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
