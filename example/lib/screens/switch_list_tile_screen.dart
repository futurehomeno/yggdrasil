import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SwitchListTileScreen extends StatefulWidget {
  const SwitchListTileScreen({super.key});

  static const String routeName = 'SwitchListTileScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SwitchListTileScreen(),
    );
  }

  @override
  State<SwitchListTileScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchListTileScreen> {
  bool? switchListTileValue = false;
  bool? switchListTileTriStateValue = false;
  bool? switchListTileDisabledValue = false;
  bool? switchListTileTrailingWidgetValue = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'SwitchListTile',
      componentDesc: 'Switch list tiles',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSwitchListTile(
            title: 'SwitchListTile',
            subtitle: 'The whole ListTile and Switch is tappable.',
            value: switchListTileValue,
            onChanged: (bool? newValue) {
              switchListTileValue = newValue;
              setState(() {});
            },
          ),
          YgSwitchListTile(
            title: 'Tri-state SwitchListTile',
            subtitle: 'The whole ListTile and Switch is tappable.',
            value: switchListTileTriStateValue,
            triState: true,
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
          // TODO(bjhandeland): Update example with YgIconButton when merged.
          YgSwitchListTile(
            title: 'SwitchListTile with trailingWidget',
            subtitle: 'Mostly used to add a YgIconButton.',
            trailingWidget: const YgIcon(YgIcons.info),
            value: switchListTileTrailingWidgetValue,
            onChanged: (bool? newValue) {
              switchListTileTrailingWidgetValue = newValue;
              setState(() {});
            },
          ),
          const YgCallout(
            title: 'Note',
            description:
                'You can also place a Switch inside a ListTile manually if you intend for only the Switch to be tappable. See the SwitchScreen for an example.',
          ),
        ],
      ),
    );
  }
}
