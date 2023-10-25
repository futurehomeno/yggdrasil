import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgCardGoldenTest',
    () {
      const YgListTile ygListTileToTest = YgListTile(
        title: YgGoldenTestValues.shortText,
        leadingWidgets: <Widget>[
          YgIcon(YgIcons.smokeGasTest),
        ],
        subtitle: YgGoldenTestValues.mediumText,
        trailingWidgets: <Widget>[
          YgIcon(YgIcons.smokeTest),
        ],
      );

      final GoldenTestGroup ygCardGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'Elevated variant with YgIcon child',
            child: const YgCard(
              variant: YgCardVariant.elevated,
              child: YgIcon(YgIcons.smokeGasTest),
            ),
          ),
          GoldenTestScenario(
            name: 'Elevated variant with short text',
            child: const YgCard(
              variant: YgCardVariant.elevated,
              child: Text(YgGoldenTestValues.shortText),
            ),
          ),
          GoldenTestScenario(
            name: 'Elevated variant with YgListTile child',
            child: const YgCard(
              variant: YgCardVariant.elevated,
              child: ygListTileToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'Elevated variant with long text',
            child: const YgCard(
              variant: YgCardVariant.elevated,
              child: Text(YgGoldenTestValues.longText),
            ),
          ),
          GoldenTestScenario(
            name: 'Filled variant with YgIcon child',
            child: const YgCard(
              variant: YgCardVariant.filled,
              child: YgIcon(YgIcons.smokeGasTest),
            ),
          ),
          GoldenTestScenario(
            name: 'Filled variant with short text',
            child: const YgCard(
              variant: YgCardVariant.filled,
              child: Text(YgGoldenTestValues.shortText),
            ),
          ),
          GoldenTestScenario(
            name: 'Filled variant with YgListTile child',
            child: const YgCard(
              variant: YgCardVariant.filled,
              child: ygListTileToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'Filled variant with long text',
            child: const YgCard(
              variant: YgCardVariant.filled,
              child: Text(YgGoldenTestValues.longText),
            ),
          ),
          GoldenTestScenario(
            name: 'Outlined variant with YgIcon child',
            child: const YgCard(
              variant: YgCardVariant.outlined,
              child: YgIcon(YgIcons.smokeGasTest),
            ),
          ),
          GoldenTestScenario(
            name: 'Outlined variant with short text',
            child: const YgCard(
              variant: YgCardVariant.outlined,
              child: Text(YgGoldenTestValues.shortText),
            ),
          ),
          GoldenTestScenario(
            name: 'Outlined variant with YgListTile child',
            child: const YgCard(
              variant: YgCardVariant.outlined,
              child: ygListTileToTest,
            ),
          ),
          GoldenTestScenario(
            name: 'Outlined variant with long text',
            child: const YgCard(
              variant: YgCardVariant.outlined,
              child: Text(YgGoldenTestValues.longText),
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgCard - ${themeTestData.themeName}',
          fileName: 'yg_card_${themeTestData.fileName}',
          builder: () => ygCardGoldenTestGroup,
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
