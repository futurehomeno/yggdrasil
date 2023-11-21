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
            name: 'YgSection without title and subtitle',
            child: const YgSection(
              child: Row(
                children: childrenToTest,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.column without title and subtitle',
            child: const YgSection.column(
              children: childrenToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.list without title and subtitle',
            child: const YgSection.list(
              children: <YgListTile>[YgListTile(title: 'YgListTile')],
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection with short title and short subtitle',
            child: const YgSection(
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
              children: childrenToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.list with short title and short subtitle',
            child: const YgSection.list(
              title: YgGoldenTestValues.shortText,
              subtitle: YgGoldenTestValues.shortText,
              children: <YgListTile>[YgListTile(title: 'YgListTile')],
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection with long title and long subtitle',
            child: const YgSection(
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
              children: childrenToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'YgSection.list with long title and long subtitle',
            child: const YgSection.list(
              title: YgGoldenTestValues.longText,
              subtitle: YgGoldenTestValues.longText,
              children: <YgListTile>[YgListTile(title: 'YgListTile')],
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
