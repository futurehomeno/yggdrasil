import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgCalloutGoldenTest',
    () {
      final GoldenTestGroup ygCalloutGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With title, description, onClose and textLink',
            child: YgCallout(
              title: YgGoldenTestValues.shortText,
              description: YgGoldenTestValues.mediumText,
              onClose: () {},
              textLink: YgTextLink(
                text: YgGoldenTestValues.shortText,
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With title, description and textLink',
            child: YgCallout(
              title: YgGoldenTestValues.shortText,
              description: YgGoldenTestValues.mediumText,
              textLink: YgTextLink(
                text: YgGoldenTestValues.shortText,
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With title and description',
            child: const YgCallout(
              title: YgGoldenTestValues.shortText,
              description: YgGoldenTestValues.longText,
            ),
          ),
          GoldenTestScenario(
            name: 'With description only',
            child: const YgCallout(
              description: YgGoldenTestValues.longText,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title and description',
            child: const YgCallout(
              title: YgGoldenTestValues.longText,
              description: YgGoldenTestValues.longText,
            ),
          ),
          GoldenTestScenario(
            name: 'With long title and very long description',
            child: const YgCallout(
              title: YgGoldenTestValues.longText,
              description: YgGoldenTestValues.longText,
            ),
          ),
          GoldenTestScenario(
            name: 'With title, description and long textLink',
            child: YgCallout(
              title: YgGoldenTestValues.shortText,
              description: YgGoldenTestValues.mediumText,
              textLink: YgTextLink(
                text: YgGoldenTestValues.longText,
                onPressed: () {},
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'With very long title, description and textLink',
            child: YgCallout(
              title: YgGoldenTestValues.longText,
              description: YgGoldenTestValues.longText,
              textLink: YgTextLink(
                text: YgGoldenTestValues.longText,
                onPressed: () {},
              ),
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgCallout ${themeTestData.themeName}',
          fileName: 'yg_callout_${themeTestData.fileName}',
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
