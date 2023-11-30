import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgSwitchGoldenTest',
    () {
      final GoldenTestGroup ygSwitchGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With value: true',
            child: YgSwitch(
              onChanged: (_) {},
              value: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With value: false',
            child: YgSwitch(
              onChanged: (_) {},
              value: false,
            ),
          ),
          GoldenTestScenario(
            name: 'With value: null (triState: true)',
            child: YgSwitch.triState(
              onChanged: (_) {},
              value: null,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgSwitch - ${themeTestData.themeName}',
          fileName: 'yg_switch_${themeTestData.fileName}',
          builder: () => ygSwitchGoldenTestGroup,
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
