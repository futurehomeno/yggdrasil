import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgTextLinkGoldenTest',
    () {
      final GoldenTestGroup ygTextLinkGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With short text',
            child: YgTextLink(
              text: YgGoldenTestValues.shortText,
              onPressed: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'With short text and external: true',
            child: YgTextLink(
              text: YgGoldenTestValues.shortText,
              onPressed: () {},
              external: true,
            ),
          ),
          GoldenTestScenario(
            name: 'With medium text',
            child: YgTextLink(
              text: YgGoldenTestValues.mediumText,
              onPressed: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'With long text and external: true',
            child: YgTextLink(
              text: YgGoldenTestValues.longText,
              onPressed: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'With short text and medium size',
            child: YgTextLink(
              text: YgGoldenTestValues.shortText,
              onPressed: () {},
              size: YgTextLinkSize.medium,
            ),
          ),
          GoldenTestScenario(
            name: 'With medium text, medium size, strong weight and external: true',
            child: YgTextLink(
              text: YgGoldenTestValues.mediumText,
              onPressed: () {},
              external: true,
              size: YgTextLinkSize.medium,
              weight: YgTextLinkWeight.strong,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgTextLink - ${themeTestData.themeName}',
          fileName: 'yg_text_link_${themeTestData.fileName}',
          builder: () => ygTextLinkGoldenTestGroup,
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
