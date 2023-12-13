import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgGaugeGoldenTest',
    () {
      final GoldenTestGroup ygGaugeGoldenTestGroup = GoldenTestGroup(
        columns: 3,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With 0.01 value',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.01,
                title: 'title',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.99 value',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.99,
                title: 'title',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.0 value and static title',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.0,
                title: 'title',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.5 value and static title',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.5,
                title: 'title',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 1.0 value and static title',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 1.0,
                title: 'title',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.75 value and buildTitle',
            child: SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.75,
                buildTitle: (double value) => value.toStringAsFixed(1),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.25 value and icon',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.25,
                icon: YgIcons.info,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.5 value, icon and label',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.5,
                icon: YgIcons.info,
                label: YgGoldenTestValues.shortText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.33 value, label and notation',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.33,
                label: YgGoldenTestValues.shortText,
                notation: 'kW',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.33 value, label, notation and title',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.33,
                label: YgGoldenTestValues.shortText,
                notation: 'kW',
                title: 'title',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.66 value, label and title',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.66,
                label: YgGoldenTestValues.shortText,
                title: 'title',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.66 value, title and icon',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.66,
                icon: YgIcons.info,
                title: 'title',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 1.0 value and longer title',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.66,
                title: YgGoldenTestValues.mediumText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 0.99 value, 0.0 min value and 200.0 max value',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 0.99,
                minValue: 0.0,
                maxValue: 200.0,
                title: 'title',
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With 100.0 value, 0.0 min value and 200.0 max value',
            child: const SizedBox.square(
              dimension: 100,
              child: YgGauge(
                value: 100.0,
                minValue: 0.0,
                maxValue: 200.0,
                title: 'title',
              ),
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgGauge - ${themeTestData.themeName}',
          fileName: 'yg_gauge_${themeTestData.fileName}',
          builder: () => ygGaugeGoldenTestGroup,
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
