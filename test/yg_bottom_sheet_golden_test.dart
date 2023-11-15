import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgBottomSheetGoldenTest',
    () {
      final GoldenTestGroup ygBottomSheetGoldenTestGroup = GoldenTestGroup(
        columns: 3,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With short title and long content',
            child: const YgBottomSheet(
              title: YgGoldenTestValues.shortText,
              content: Text(YgGoldenTestValues.longText),
            ),
          ),
          GoldenTestScenario(
            name: 'With long title and long content',
            child: const YgBottomSheet(
              title: YgGoldenTestValues.longText,
              content: Text(YgGoldenTestValues.longText),
            ),
          ),
          GoldenTestScenario(
            name: 'With short title, long content and footerButtons',
            child: YgBottomSheet(
              title: YgGoldenTestValues.shortText,
              content: const Text(YgGoldenTestValues.longText),
              footerButtons: YgButtonGroup(
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
          'YgBottomSheet - ${themeTestData.themeName}',
          fileName: 'yg_bottom_sheet_${themeTestData.fileName}',
          builder: () => ygBottomSheetGoldenTestGroup,
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
