import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgTagGoldenTest',
    () {
      final GoldenTestGroup ygTagGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With short text, informative variant',
            child: const YgTag(
              variant: YgTagVariant.informative,
              child: Text(
                YgGoldenTestValues.shortText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With medium text, negative variant',
            child: const YgTag(
              variant: YgTagVariant.negative,
              child: Text(
                YgGoldenTestValues.mediumText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With leadingIcon, neutral variant',
            child: const YgTag.leadingIcon(
              variant: YgTagVariant.neutral,
              icon: YgIcons.info,
              child: Text(
                YgGoldenTestValues.shortText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With trailingIcon, positive variant',
            child: const YgTag.trailingIcon(
              variant: YgTagVariant.positive,
              icon: YgIcons.info,
              child: Text(
                YgGoldenTestValues.shortText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With doubleIcon, warning variant',
            child: const YgTag.doubleIcon(
              variant: YgTagVariant.warning,
              leadingIcon: YgIcons.info,
              trailingIcon: YgIcons.info,
              child: Text(
                YgGoldenTestValues.shortText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With small size',
            child: const YgTag(
              size: YgTagSize.small,
              child: Text(
                YgGoldenTestValues.shortText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With strong weight',
            child: const YgTag(
              weight: YgTagWeight.strong,
              child: Text(
                YgGoldenTestValues.shortText,
              ),
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgTag - ${themeTestData.themeName}',
          fileName: 'yg_tag_${themeTestData.fileName}',
          builder: () => ygTagGoldenTestGroup,
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
