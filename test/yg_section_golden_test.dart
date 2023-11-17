import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgSectionGoldenTest',
    () {
      // Using basic widgets to avoid having the tests break when things change.
      const List<Widget> childrenToTest = <Widget>[
        SizedBox.square(
          dimension: 100.0,
          child: YgIcon(YgIcons.info),
        ),
        Flexible(
          child: Text(
            YgGoldenTestValues.longText,
          ),
        ),
        SizedBox.square(
          dimension: 100.0,
          child: YgIcon(YgIcons.info),
        ),
      ];

      final GoldenTestGroup ygSectionGoldenTestGroup = GoldenTestGroup(
        columns: 3,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'YgSection.base without title and subtitle',
            child: const YgSection.base(
              child: Row(
                children: childrenToTest,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.column without title and subtitle',
            child: const YgSection.column(
              mainAxisSize: MainAxisSize.min,
              children: childrenToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.list without title and subtitle',
            child: const YgSection.list(
              mainAxisSize: MainAxisSize.min,
              children: childrenToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.base with short title and short subtitle',
            child: const YgSection.base(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.shortText,
              child: Row(
                children: childrenToTest,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.column with short title and short subtitle',
            child: const YgSection.column(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.shortText,
              mainAxisSize: MainAxisSize.min,
              children: childrenToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.list with short title and short subtitle',
            child: const YgSection.list(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.shortText,
              mainAxisSize: MainAxisSize.min,
              children: childrenToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.base with long title and long subtitle',
            child: const YgSection.base(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              child: Row(
                children: childrenToTest,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.column with long title and long subtitle',
            child: const YgSection.column(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              mainAxisSize: MainAxisSize.min,
              children: childrenToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.list with long title and long subtitle',
            child: const YgSection.list(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              mainAxisSize: MainAxisSize.min,
              children: childrenToTest,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgSection - ${themeTestData.themeName}',
          fileName: 'yg_section_${themeTestData.fileName}',
          builder: () => ygSectionGoldenTestGroup,
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
