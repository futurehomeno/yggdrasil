import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  // We want to render shadows for this particular test,
  // so we wrap it with it's own configuration.
  AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      ciGoldensConfig: CiGoldensConfig(
        renderShadows: true,
      ),
    ),
    run: () {
      group(
        'YgCardGoldenTest',
        () {
          const YgListTile ygListTileToTest = YgListTile(
            title: YgGoldenTestValues.shortText,
            subtitle: YgGoldenTestValues.mediumText,
          );

          final GoldenTestGroup ygCardGoldenTestGroup = GoldenTestGroup(
            columns: 2,
            scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
            children: <GoldenTestScenario>[
              GoldenTestScenario(
                name: 'Elevated variant with YgListTile',
                child: const YgCard(
                  variant: YgCardVariant.elevated,
                  child: ygListTileToTest,
                ),
              ),
              GoldenTestScenario(
                name: 'Filled variant with YgListTile',
                child: const YgCard(
                  variant: YgCardVariant.filled,
                  child: ygListTileToTest,
                ),
              ),
              GoldenTestScenario(
                name: 'Outlined variant with YgListTile',
                child: const YgCard(
                  variant: YgCardVariant.outlined,
                  child: ygListTileToTest,
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
    },
  );
}
