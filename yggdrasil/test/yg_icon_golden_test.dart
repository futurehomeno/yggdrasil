import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgIconGoldenTest',
    () {
      final GoldenTestGroup ygIconGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With info icon',
            child: const YgIcon(YgIcons.info),
          ),
          GoldenTestScenario(
            name: 'With info icon and custom color',
            child: const YgIcon.colorable(
              YgIcons.info,
              color: FhColors.actionCriticalDefault,
            ),
          ),
          GoldenTestScenario(
            name: 'With info icon and small size',
            child: const YgIcon(
              YgIcons.info,
              size: YgIconSize.small,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgIcon - ${themeTestData.themeName}',
          fileName: 'yg_icon_${themeTestData.fileName}',
          builder: () => ygIconGoldenTestGroup,
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
