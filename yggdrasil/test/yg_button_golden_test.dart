import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgButtonGoldenTest',
    () {
      const String clickMeText = 'Click me';

      final GoldenTestGroup ygButtonGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'Critical variant with small size',
            child: YgButton(
              variant: YgButtonVariant.critical,
              onPressed: () {},
              size: YgButtonSize.small,
              child: const Text(clickMeText),
            ),
          ),
          GoldenTestScenario(
            name: 'Link variant with medium size',
            child: YgButton(
              variant: YgButtonVariant.link,
              onPressed: () {},
              size: YgButtonSize.medium,
              child: const Text(clickMeText),
            ),
          ),
          GoldenTestScenario(
            name: 'Primary variant with large size',
            child: YgButton(
              variant: YgButtonVariant.primary,
              onPressed: () {},
              size: YgButtonSize.large,
              child: const Text(clickMeText),
            ),
          ),
          GoldenTestScenario(
            name: 'Secondary variant with large size',
            child: YgButton(
              variant: YgButtonVariant.secondary,
              onPressed: () {},
              size: YgButtonSize.large,
              child: const Text(clickMeText),
            ),
          ),
          GoldenTestScenario(
            name: 'Text variant with default size',
            child: YgButton(
              variant: YgButtonVariant.text,
              onPressed: () {},
              child: const Text(clickMeText),
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgButton - ${themeTestData.themeName}',
          fileName: 'yg_button_${themeTestData.fileName}',
          builder: () => ygButtonGoldenTestGroup,
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
