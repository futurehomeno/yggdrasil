import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgDividerGoldenTest',
    () {
      final GoldenTestGroup ygDividerGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With no indents',
            child: const YgDivider(),
          ),
          GoldenTestScenario(
            name: 'With small indents',
            child: const YgDivider(
              endIndent: YgDividerIndent.small,
              indent: YgDividerIndent.small,
            ),
          ),
          GoldenTestScenario(
            name: 'With medium indents',
            child: const YgDivider(
              endIndent: YgDividerIndent.medium,
              indent: YgDividerIndent.medium,
            ),
          ),
          GoldenTestScenario(
            name: 'With large indents',
            child: const YgDivider(
              endIndent: YgDividerIndent.large,
              indent: YgDividerIndent.large,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgDivider - ${themeTestData.themeName}',
          fileName: 'yg_divider_${themeTestData.fileName}',
          builder: () => ygDividerGoldenTestGroup,
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
