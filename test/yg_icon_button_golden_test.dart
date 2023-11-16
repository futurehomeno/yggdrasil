import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgIconButtonGoldenTest',
    () {
      final GoldenTestGroup ygIconButtonGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With standard variant',
            child: YgIconButton(
              onPressed: () {},
              variant: YgIconButtonVariant.standard,
              child: const YgIcon(YgIcons.info),
            ),
          ),
          GoldenTestScenario(
            name: 'With filled variant',
            child: YgIconButton(
              onPressed: () {},
              variant: YgIconButtonVariant.filled,
              child: const YgIcon(YgIcons.info),
            ),
          ),
          GoldenTestScenario(
            name: 'With outlined variant',
            child: YgIconButton(
              onPressed: () {},
              variant: YgIconButtonVariant.outlined,
              child: const YgIcon(YgIcons.info),
            ),
          ),
          GoldenTestScenario(
            name: 'With tonal variant',
            child: YgIconButton(
              onPressed: () {},
              variant: YgIconButtonVariant.tonal,
              child: const YgIcon(YgIcons.info),
            ),
          ),
          GoldenTestScenario(
            name: 'With small size',
            child: YgIconButton(
              onPressed: () {},
              size: YgIconButtonSize.small,
              child: const YgIcon(YgIcons.info),
            ),
          ),
          GoldenTestScenario(
            name: 'With custom style and small size',
            child: YgIconButton(
              onPressed: () {},
              size: YgIconButtonSize.small,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (_) => FhColors.actionCriticalDefault,
                ),
              ),
              child: const YgIcon(YgIcons.info),
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgIconButton - ${themeTestData.themeName}',
          fileName: 'yg_icon_button_${themeTestData.fileName}',
          builder: () => ygIconButtonGoldenTestGroup,
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
