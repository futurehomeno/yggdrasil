import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgToggleButtonGoldenTest',
    () {
      final GoldenTestGroup ygToggleButtonGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With short text and value true',
            child: YgToggleButton(
              text: YgGoldenTestValues.shortText,
              value: true,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'With short text and value false',
            child: YgToggleButton(
              text: YgGoldenTestValues.shortText,
              value: false,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'With medium text and value true',
            child: YgToggleButton(
              text: YgGoldenTestValues.mediumText,
              value: true,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'With long text and value false',
            child: YgToggleButton(
              text: YgGoldenTestValues.longText,
              value: false,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'With short text, value true and icon',
            child: YgToggleButton(
              text: YgGoldenTestValues.shortText,
              value: true,
              icon: YgIcons.info,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'With short text, value true and large size',
            child: YgToggleButton(
              text: YgGoldenTestValues.shortText,
              value: true,
              icon: YgIcons.info,
              onChanged: (_) {},
              size: YgToggleButtonSize.large,
            ),
          ),
          GoldenTestScenario(
            name: 'With short text, value true and small size',
            child: YgToggleButton(
              text: YgGoldenTestValues.shortText,
              value: true,
              icon: YgIcons.info,
              onChanged: (_) {},
              size: YgToggleButtonSize.small,
            ),
          ),
          GoldenTestScenario(
            name: 'With icon only',
            child: YgToggleButton.onlyIcon(
              value: true,
              icon: YgIcons.info,
              onChanged: (_) {},
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgToggleButton - ${themeTestData.themeName}',
          fileName: 'yg_toggle_button_${themeTestData.fileName}',
          builder: () => ygToggleButtonGoldenTestGroup,
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
