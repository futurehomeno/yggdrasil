import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgDialogGoldenTest',
    () {
      final GoldenTestGroup ygDialogGoldenTestGroup = GoldenTestGroup(
        columns: 3,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With header, title and description',
            child: const YgDialog(
              icon: YgIcon(YgIcons.info),
              title: YgGoldenTestValues.shortText,
              description: YgGoldenTestValues.mediumText,
            ),
          ),
          GoldenTestScenario(
            name: 'With header, long title and long description',
            child: const YgDialog(
              icon: YgIcon(YgIcons.info),
              title: YgGoldenTestValues.longText,
              description: YgGoldenTestValues.longText,
            ),
          ),
          GoldenTestScenario(
            name: 'Error variant',
            child: const YgDialog.error(
              title: YgGoldenTestValues.shortText,
            ),
          ),
          GoldenTestScenario(
            name: 'Info variant',
            child: const YgDialog.info(
              title: YgGoldenTestValues.shortText,
            ),
          ),
          GoldenTestScenario(
            name: 'Loading variant',
            child: const YgDialog.loading(
              title: YgGoldenTestValues.shortText,
            ),
          ),
          GoldenTestScenario(
            name: 'Success variant',
            child: const YgDialog.success(
              title: YgGoldenTestValues.shortText,
            ),
          ),
          GoldenTestScenario(
            name: 'With header, title, description and button group',
            child: YgDialog(
              icon: const YgIcon(YgIcons.info),
              title: YgGoldenTestValues.shortText,
              description: YgGoldenTestValues.mediumText,
              ygButtonGroup: YgButtonGroup.vertical(
                children: <YgButton>[
                  YgButton(
                    onPressed: () {},
                    child: const Text('OK'),
                  ),
                  YgButton(
                    onPressed: () {},
                    child: const Text('CANCEL'),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgDialog - ${themeTestData.themeName}',
          fileName: 'yg_dialog_${themeTestData.fileName}',
          builder: () => ygDialogGoldenTestGroup,
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
