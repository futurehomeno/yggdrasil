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
            name: 'With single-digit amount, YgIconButton child and default alignment',
            child: YgBadge(
              amount: 4,
              child: YgIconButton(
                child: const YgIcon(YgIcons.smokeTest),
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With double-digit amount, YgIconButton child and default alignment',
            child: YgBadge(
              amount: 44,
              child: YgIconButton(
                child: const YgIcon(YgIcons.smokeTest),
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With triple-digit amount, YgIconButton child and default alignment',
            child: YgBadge(
              amount: 44,
              child: YgIconButton(
                child: const YgIcon(YgIcons.smokeTest),
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With double-digit amount, YgIconButton child and strong weight',
            child: YgBadge(
              amount: 44,
              weight: YgBadgeWeight.strong,
              child: YgIconButton(
                child: const YgIcon(YgIcons.smokeTest),
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With double-digit amount, YgIconButton child and weak weight',
            child: YgBadge(
              amount: 44,
              weight: YgBadgeWeight.weak,
              child: YgIconButton(
                child: const YgIcon(YgIcons.smokeTest),
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With double-digit amount, YgIconButton child and topLeft alignment',
            child: YgBadge(
              amount: 44,
              alignment: Alignment.topLeft,
              child: YgIconButton(
                child: const YgIcon(YgIcons.smokeTest),
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With single-digit amount, YgIcon child, default alignment',
            child: const YgBadge(
              amount: 4,
              child: YgIcon(YgIcons.smokeTest),
            ),
          ),
          GoldenTestScenario(
            name: 'With double-digit amount, YgIcon child, default alignment',
            child: const YgBadge(
              amount: 44,
              child: YgIcon(YgIcons.smokeTest),
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
