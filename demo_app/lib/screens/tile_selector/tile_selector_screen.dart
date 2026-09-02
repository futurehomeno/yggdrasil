import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TileSelectorScreen extends StatefulWidget {
  const TileSelectorScreen({super.key});

  static const String routeName = 'TileSelectorScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TileSelectorScreen(),
    );
  }

  @override
  State<TileSelectorScreen> createState() => _TileSelectorScreenState();
}

class _TileSelectorScreenState extends State<TileSelectorScreen> {
  static const List<YgSelectorTile<String>> _modes = <YgSelectorTile<String>>[
    YgSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
    YgSelectorTile<String>(value: 'away', icon: YgIcons.homeAway, label: 'Away'),
    YgSelectorTile<String>(value: 'sleep', icon: YgIcons.night, label: 'Sleep'),
    YgSelectorTile<String>(value: 'vacation', icon: YgIcons.homeVacation, label: 'Vacation'),
  ];

  static const List<YgSelectorTile<String>> _partiallyDisabledModes = <YgSelectorTile<String>>[
    YgSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
    YgSelectorTile<String>(value: 'away', icon: YgIcons.homeAway, label: 'Away'),
    YgSelectorTile<String>(value: 'sleep', icon: YgIcons.night, label: 'Sleep', disabled: true),
    YgSelectorTile<String>(value: 'vacation', icon: YgIcons.homeVacation, label: 'Vacation'),
  ];

  static const List<YgSelectorTile<String>> _manyModes = <YgSelectorTile<String>>[
    ..._modes,
    YgSelectorTile<String>(value: 'heat', icon: YgIcons.flames, label: 'Heat'),
    YgSelectorTile<String>(value: 'eco', icon: YgIcons.leaf, label: 'Eco'),
    YgSelectorTile<String>(value: 'auto', icon: YgIcons.autoChange, label: 'Auto'),
  ];

  static const List<YgSelectorTile<String>> _twoModes = <YgSelectorTile<String>>[
    YgSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
    YgSelectorTile<String>(value: 'away', icon: YgIcons.homeAway, label: 'Away'),
  ];

  static const List<YgSelectorTile<String>> _threeModes = <YgSelectorTile<String>>[
    ..._twoModes,
    YgSelectorTile<String>(value: 'sleep', icon: YgIcons.night, label: 'Sleep'),
  ];

  String smallValue = 'home';
  String mediumValue = 'home';
  String largeValue = 'home';
  String outlinedValue = 'home';
  String outlinedDisabledValue = 'home';
  String partiallyDisabledValue = 'home';
  String scrollingValue = 'home';
  String twoModesValue = 'home';
  String threeModesValue = 'home';

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'TileSelector',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection(
              title: 'Small tile selector',
              child: YgTileSelector<String>(
                tiles: _modes,
                value: smallValue,
                size: YgTileSelectorSize.small,
                onValueChanged: (String newValue) => setState(() => smallValue = newValue),
              ),
            ),
            YgSection(
              title: 'Medium tile selector',
              child: YgTileSelector<String>(
                tiles: _modes,
                value: mediumValue,
                onValueChanged: (String newValue) => setState(() => mediumValue = newValue),
              ),
            ),
            YgSection(
              title: 'Large tile selector',
              child: YgTileSelector<String>(
                tiles: _modes,
                value: largeValue,
                size: YgTileSelectorSize.large,
                onValueChanged: (String newValue) => setState(() => largeValue = newValue),
              ),
            ),
            YgSection(
              title: 'Outlined tile selector',
              child: YgTileSelector<String>(
                tiles: _modes,
                value: outlinedValue,
                variant: YgTileSelectorVariant.outlined,
                onValueChanged: (String newValue) => setState(() => outlinedValue = newValue),
              ),
            ),
            YgSection(
              title: 'Outlined with a disabled tile',
              child: YgTileSelector<String>(
                tiles: _partiallyDisabledModes,
                value: outlinedDisabledValue,
                variant: YgTileSelectorVariant.outlined,
                onValueChanged: (String newValue) => setState(() => outlinedDisabledValue = newValue),
              ),
            ),
            YgSection(
              title: 'With a disabled tile',
              child: YgTileSelector<String>(
                tiles: _partiallyDisabledModes,
                value: partiallyDisabledValue,
                onValueChanged: (String newValue) => setState(() => partiallyDisabledValue = newValue),
              ),
            ),
            YgSection.column(
              title: 'Two or three tiles',
              children: <Widget>[
                YgTileSelector<String>(
                  tiles: _twoModes,
                  value: twoModesValue,
                  onValueChanged: (String newValue) => setState(() => twoModesValue = newValue),
                ),
                YgTileSelector<String>(
                  tiles: _threeModes,
                  value: threeModesValue,
                  variant: YgTileSelectorVariant.outlined,
                  onValueChanged: (String newValue) => setState(() => threeModesValue = newValue),
                ),
              ].withVerticalSpacing(20),
            ),
            const YgSection(
              title: 'Disabled tile selector',
              child: YgTileSelector<String>(
                tiles: _modes,
                value: 'home',
                onValueChanged: null,
              ),
            ),
            YgSection(
              title: 'More than 5 tiles becomes scrollable',
              child: YgTileSelector<String>(
                tiles: _manyModes,
                value: scrollingValue,
                onValueChanged: (String newValue) => setState(() => scrollingValue = newValue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
