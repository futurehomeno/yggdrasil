import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgRadioGroupGoldenTest',
    () {
      final GoldenTestGroup ygRadioGroupGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With short label, and 1 item',
            child: YgRadioGroup<bool>(
              label: YgGoldenTestValues.shortText,
              radioItems: <YgRadioItem<bool>>[
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: true,
                  groupValue: false,
                  title: YgGoldenTestValues.mediumText,
                ),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With medium label, and 2 items',
            child: YgRadioGroup<bool>(
              label: YgGoldenTestValues.mediumText,
              radioItems: <YgRadioItem<bool>>[
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: false,
                  groupValue: true,
                  title: YgGoldenTestValues.mediumText,
                ),
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: true,
                  groupValue: true,
                  title: YgGoldenTestValues.mediumText,
                ),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With long label, and 3 items',
            child: YgRadioGroup<bool>(
              label: YgGoldenTestValues.longText,
              radioItems: <YgRadioItem<bool>>[
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: false,
                  groupValue: true,
                  title: YgGoldenTestValues.shortText,
                ),
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: true,
                  groupValue: true,
                  title: YgGoldenTestValues.mediumText,
                ),
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: false,
                  groupValue: true,
                  title: YgGoldenTestValues.longText,
                ),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With maximum of 5 YgRadioItems',
            child: YgRadioGroup<bool>(
              label: YgGoldenTestValues.shortText,
              radioItems: <YgRadioItem<bool>>[
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: false,
                  groupValue: true,
                  title: YgGoldenTestValues.mediumText,
                ),
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: true,
                  groupValue: true,
                  title: YgGoldenTestValues.mediumText,
                ),
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: true,
                  groupValue: false,
                  title: YgGoldenTestValues.mediumText,
                ),
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: false,
                  groupValue: true,
                  title: YgGoldenTestValues.mediumText,
                ),
                YgRadioItem<bool>(
                  onChanged: (_) {},
                  value: false,
                  groupValue: true,
                  title: YgGoldenTestValues.mediumText,
                ),
              ],
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgRadioGroup - ${themeTestData.themeName}',
          fileName: 'yg_radio_group_${themeTestData.fileName}',
          builder: () => ygRadioGroupGoldenTestGroup,
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
