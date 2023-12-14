import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgSegmentedButtonGoldenTest',
    () {
      final GoldenTestGroup ygSegmentedButtonGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'A 3 segment button with only labels and value 1',
            child: YgSegmentedButton<int>(
              value: 1,
              segments: const <YgButtonSegment<int>>[
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 1),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 2),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 3),
              ],
              onValueChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'A 3 segment button with icons and labels and value 2',
            child: YgSegmentedButton<int>(
              value: 2,
              segments: const <YgButtonSegment<int>>[
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, icon: YgIcon(YgIcons.placeholder), value: 1),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, icon: YgIcon(YgIcons.placeholder), value: 2),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, icon: YgIcon(YgIcons.placeholder), value: 3),
              ],
              onValueChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'A 3 segment button with only icons and value 3',
            child: YgSegmentedButton<int>(
              value: 3,
              segments: const <YgButtonSegment<int>>[
                YgButtonSegment<int>.iconOnly(icon: YgIcon(YgIcons.placeholder), value: 1),
                YgButtonSegment<int>.iconOnly(icon: YgIcon(YgIcons.placeholder), value: 2),
                YgButtonSegment<int>.iconOnly(icon: YgIcon(YgIcons.placeholder), value: 3),
              ],
              onValueChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'A disabled 3 segment button',
            child: YgSegmentedButton<int>(
              value: 1,
              segments: const <YgButtonSegment<int>>[
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 1),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 2),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 3),
              ],
              onValueChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'A multi select 3 segment button with all values selected',
            child: YgSegmentedButton<int>.multiSelect(
              value: const <int>{1, 2, 3},
              segments: const <YgButtonSegment<int>>[
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 1),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 2),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 3),
              ],
              onValueChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'A multi select 3 segment button without selected values',
            child: YgSegmentedButton<int>.multiSelect(
              value: const <int>{1, 2, 3},
              segments: const <YgButtonSegment<int>>[
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 1),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 2),
                YgButtonSegment<int>(label: YgGoldenTestValues.shortText, value: 3),
              ],
              onValueChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'A 5 segment button with long labels and value 3',
            child: YgSegmentedButton<int>(
              value: 3,
              segments: const <YgButtonSegment<int>>[
                YgButtonSegment<int>(label: YgGoldenTestValues.longText, value: 1),
                YgButtonSegment<int>(label: YgGoldenTestValues.longText, value: 2),
                YgButtonSegment<int>(label: YgGoldenTestValues.longText, value: 3),
                YgButtonSegment<int>(label: YgGoldenTestValues.longText, value: 4),
                YgButtonSegment<int>(label: YgGoldenTestValues.longText, value: 5),
              ],
              onValueChanged: (_) {},
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgSegmentedButton - ${themeTestData.themeName}',
          fileName: 'yg_segmented_button_${themeTestData.fileName}',
          builder: () => ygSegmentedButtonGoldenTestGroup,
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
