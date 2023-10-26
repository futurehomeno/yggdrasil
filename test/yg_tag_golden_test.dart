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
      final GoldenTestGroup ygCalloutGoldenTestGroup = GoldenTestGroup(
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
            child: YgTag.leadingIcon(
              variant: YgTagVariant.neutral,
              icon: const YgIcon(YgIcons.info),
              child: const Text(
                YgGoldenTestValues.shortText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With trailingIcon, positive variant',
            child: YgTag.trailingIcon(
              variant: YgTagVariant.positive,
              icon: const YgIcon(YgIcons.info),
              child: const Text(
                YgGoldenTestValues.shortText,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With doubleIcon, warning variant',
            child: YgTag.doubleIcon(
              variant: YgTagVariant.warning,
              leadingIcon: const YgIcon(YgIcons.info),
              trailingIcon: const YgIcon(YgIcons.info),
              child: const Text(
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
          GoldenTestScenario(
            name: 'With custom style',
            child: YgTag.trailingIcon(
              icon: const YgIcon(YgIcons.info),
              style: ButtonStyle(
                iconColor: MaterialStateProperty.resolveWith((_) => Colors.red),
                backgroundColor: MaterialStateProperty.resolveWith((_) => Colors.amber),
                elevation: MaterialStateProperty.resolveWith((_) => 10.0),
              ),
              child: const Text(
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
          builder: () => ygCalloutGoldenTestGroup,
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
