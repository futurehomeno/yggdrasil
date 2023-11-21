import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgButtonGroupGoldenTest',
    () {
      final YgButton buttonToTest = YgButton(
        onPressed: () {},
        child: const Text('Click me'),
      );

      final GoldenTestGroup ygButtonGroupGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'Vertical with 1 button',
            child: YgButtonGroup.vertical(
              children: <YgButton>[
                buttonToTest,
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'Vertical with 3 buttons',
            child: YgButtonGroup.vertical(
              children: <YgButton>[
                buttonToTest,
                buttonToTest,
                buttonToTest,
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'Vertical with action or cancel',
            child: YgButtonGroup.verticalActionOrCancel(
              actionText: 'Save',
              cancelText: 'Cancel',
              onActionPressed: () {},
              onCancelPressed: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'Horizontal with 1 button',
            child: YgButtonGroup.horizontal(
              children: <YgButton>[
                buttonToTest,
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'Horizontal with 3 button',
            child: YgButtonGroup.horizontal(
              children: <YgButton>[
                buttonToTest,
                buttonToTest,
                buttonToTest,
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'Horizontal with action or cancel',
            child: YgButtonGroup.horizontalActionOrCancel(
              actionText: 'Save',
              cancelText: 'Cancel',
              onActionPressed: () {},
              onCancelPressed: () {},
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgButtonGroup - ${themeTestData.themeName}',
          fileName: 'yg_button_group_${themeTestData.fileName}',
          builder: () => ygButtonGroupGoldenTestGroup,
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
