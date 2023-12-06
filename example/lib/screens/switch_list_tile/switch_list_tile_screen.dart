import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SwitchListTileScreen extends StatefulWidget {
  const SwitchListTileScreen({super.key});

  static const String routeName = 'SwitchListTileScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SwitchListTileScreen(),
    );
  }

  @override
  State<SwitchListTileScreen> createState() => SwitchListTileScreenState();
}

class SwitchListTileScreenState extends State<SwitchListTileScreen> {
  bool switchListTileValue = false;
  bool? switchListTileTriStateValue = false;
  bool switchListTileDisabledValue = false;
  bool switchListTileTrailingWidgetValue = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'SwitchListTile',
      child: Column(
        children: <Widget>[
          const YgSection(
            child: YgCallout(
              title: 'Note',
              description:
                  'You can also place a Switch inside a ListTile manually if you intend for only the Switch to be tappable. See the SwitchScreen for an example.',
            ),
          ),
          YgSection.list(
            children: <YgListTile>[
              YgSwitchListTile(
                title: 'SwitchListTile',
                subtitle: 'The whole ListTile and Switch is tappable.',
                value: switchListTileValue,
                onChanged: (bool newValue) {
                  switchListTileValue = newValue;
                  setState(() {});
                },
              ),
              YgSwitchListTile.triState(
                title: 'Tri-state SwitchListTile',
                subtitle: 'The whole ListTile and Switch is tappable.',
                value: switchListTileTriStateValue,
                onChanged: (bool? newValue) {
                  switchListTileTriStateValue = newValue;
                  setState(() {});
                },
              ),
              YgSwitchListTile(
                title: 'Disabled SwitchListTile',
                subtitle: 'Tapping anywhere does nothing.',
                value: switchListTileDisabledValue,
                onChanged: null,
              ),
              YgSwitchListTile(
                title: 'With trailingWidget',
                subtitle: 'Mostly used to add a YgIconButton.',
                trailingWidget: YgIconButton(
                  onPressed: () {},
                  child: const YgIcon(YgIcons.info),
                ),
                value: switchListTileTrailingWidgetValue,
                onChanged: (bool newValue) {
                  switchListTileTrailingWidgetValue = newValue;
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
