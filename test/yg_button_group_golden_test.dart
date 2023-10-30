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
      final YgButton ygButtonToGroup = YgButton(
        onPressed: () {},
        child: const Text('Click me'),
      );

      final GoldenTestGroup ygButtonGroupGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With vertical axis',
            child: YgButtonGroup(
              axis: Axis.vertical,
              children: <YgButton>[
                ygButtonToGroup,
                ygButtonToGroup,
                ygButtonToGroup,
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With horizontal axis',
            child: YgButtonGroup(
              axis: Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              children: <YgButton>[
                ygButtonToGroup,
                ygButtonToGroup,
              ],
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
