import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void _onValueChanged(String newValue) {}

void main() {
  group(
    'YgTileSelectorGoldenTest',
    () {
      const List<YgTileSelectorTile<String>> modes = <YgTileSelectorTile<String>>[
        YgTileSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
        YgTileSelectorTile<String>(value: 'away', icon: YgIcons.homeAway, label: 'Away'),
        YgTileSelectorTile<String>(value: 'sleep', icon: YgIcons.night, label: 'Sleep'),
        YgTileSelectorTile<String>(value: 'vacation', icon: YgIcons.homeVacation, label: 'Vacation'),
      ];

      const List<YgTileSelectorTile<String>> partiallyDisabledModes = <YgTileSelectorTile<String>>[
        YgTileSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
        YgTileSelectorTile<String>(value: 'away', icon: YgIcons.homeAway, label: 'Away'),
        YgTileSelectorTile<String>(value: 'sleep', icon: YgIcons.night, label: 'Sleep', disabled: true),
        YgTileSelectorTile<String>(value: 'vacation', icon: YgIcons.homeVacation, label: 'Vacation'),
      ];

      const List<YgTileSelectorTile<String>> manyModes = <YgTileSelectorTile<String>>[
        ...modes,
        YgTileSelectorTile<String>(value: 'heat', icon: YgIcons.flames, label: 'Heat'),
        YgTileSelectorTile<String>(value: 'eco', icon: YgIcons.leaf, label: 'Eco'),
        YgTileSelectorTile<String>(value: 'auto', icon: YgIcons.autoChange, label: 'Auto'),
      ];

      final GoldenTestGroup ygTileSelectorGoldenTestGroup = GoldenTestGroup(
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'Small',
            child: const YgTileSelector<String>(
              tiles: modes,
              value: 'home',
              size: YgTileSelectorSize.small,
              onValueChanged: _onValueChanged,
            ),
          ),
          GoldenTestScenario(
            name: 'Medium',
            child: const YgTileSelector<String>(
              tiles: modes,
              value: 'home',
              onValueChanged: _onValueChanged,
            ),
          ),
          GoldenTestScenario(
            name: 'Large',
            child: const YgTileSelector<String>(
              tiles: modes,
              value: 'home',
              size: YgTileSelectorSize.large,
              onValueChanged: _onValueChanged,
            ),
          ),
          GoldenTestScenario(
            name: 'Outlined',
            child: const YgTileSelector<String>(
              tiles: modes,
              value: 'home',
              variant: YgTileSelectorVariant.outlined,
              onValueChanged: _onValueChanged,
            ),
          ),
          GoldenTestScenario(
            name: 'Outlined with a disabled tile',
            child: const YgTileSelector<String>(
              tiles: partiallyDisabledModes,
              value: 'home',
              variant: YgTileSelectorVariant.outlined,
              onValueChanged: _onValueChanged,
            ),
          ),
          GoldenTestScenario(
            name: 'With a disabled tile',
            child: const YgTileSelector<String>(
              tiles: partiallyDisabledModes,
              value: 'home',
              onValueChanged: _onValueChanged,
            ),
          ),
          GoldenTestScenario(
            name: 'With two tiles',
            child: const YgTileSelector<String>(
              tiles: <YgTileSelectorTile<String>>[
                YgTileSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
                YgTileSelectorTile<String>(value: 'away', icon: YgIcons.homeAway, label: 'Away'),
              ],
              value: 'home',
              onValueChanged: _onValueChanged,
            ),
          ),
          GoldenTestScenario(
            name: 'With three tiles outlined',
            child: const YgTileSelector<String>(
              tiles: <YgTileSelectorTile<String>>[
                YgTileSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
                YgTileSelectorTile<String>(value: 'away', icon: YgIcons.homeAway, label: 'Away'),
                YgTileSelectorTile<String>(value: 'sleep', icon: YgIcons.night, label: 'Sleep'),
              ],
              value: 'home',
              variant: YgTileSelectorVariant.outlined,
              onValueChanged: _onValueChanged,
            ),
          ),
          GoldenTestScenario(
            name: 'Disabled',
            child: const YgTileSelector<String>(
              tiles: modes,
              value: 'home',
              onValueChanged: null,
            ),
          ),
          GoldenTestScenario(
            name: 'With more than 5 tiles',
            child: const YgTileSelector<String>(
              tiles: manyModes,
              value: 'home',
              onValueChanged: _onValueChanged,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgTileSelector - ${themeTestData.themeName}',
          fileName: 'yg_tile_selector_${themeTestData.fileName}',
          builder: () => ygTileSelectorGoldenTestGroup,
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
