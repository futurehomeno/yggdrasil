import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgBadgeGoldenTest',
    () {
      final GoldenTestGroup ygBadgeGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With amount under 10',
            child: YgBadge(
              amount: 4,
              child: YgIconButton(
                icon: YgIcons.info,
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With amount over 10',
            child: YgBadge(
              amount: 44,
              child: YgIconButton(
                icon: YgIcons.info,
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With amount over 10 and strong weight',
            child: YgBadge(
              amount: 44,
              weight: YgBadgeWeight.strong,
              child: YgIconButton(
                icon: YgIcons.info,
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With amount over 10 and topLeft alignment',
            child: YgBadge(
              amount: 44,
              alignment: Alignment.topLeft,
              child: YgIconButton(
                icon: YgIcons.info,
                onPressed: () {},
              ),
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgBadge - ${themeTestData.themeName}',
          fileName: 'yg_badge_${themeTestData.fileName}',
          builder: () => ygBadgeGoldenTestGroup,
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
