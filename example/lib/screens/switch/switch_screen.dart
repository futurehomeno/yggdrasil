import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  static const String routeName = 'SwitchScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SwitchScreen(),
    );
  }

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool? binaryValue = false;
  bool? triStateValue = false;
  bool? disabledFalseValue = false;
  bool? disabledTrueValue = true;
  bool? disabledNullValue;
  bool? listTileValue = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Switch',
      componentDesc: 'Switches',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'Binary switch'),
              YgSwitch(
                value: binaryValue,
                onChanged: (bool? newValue) {
                  binaryValue = newValue;
                  setState(() {});
                },
              ),
            ],
          ),
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'Tri-state switch'),
              YgSwitch(
                value: triStateValue,
                triState: true,
                onChanged: (bool? newValue) {
                  triStateValue = newValue;
                  setState(() {});
                },
              ),
            ],
          ),
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'Disabled switch'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  YgSwitch(
                    value: disabledFalseValue,
                    onChanged: null,
                  ),
                  YgSwitch(
                    value: disabledNullValue,
                    onChanged: null,
                  ),
                  YgSwitch(
                    value: disabledTrueValue,
                    onChanged: null,
                  ),
                ].withHorizontalSpacing(10.0),
              ),
            ],
          ),
          YgSectionColumn(
            children: <Widget>[
              YgSectionTile(
                title: 'Switch in a list tile',
              ),
              YgCallout(
                variant: YgCalloutVariant.warning,
                description:
                    'You can place a Switch in a list tile as shown below, but consider using SwitchListTile instead if you intend for the whole list tile to be tappable.',
              ),
              YgListTile(
                title: 'Switch in a list tile',
                subtitle: 'Only the Switch is tappable.',
                trailingWidgets: <Widget>[
                  YgSwitch(
                    value: listTileValue,
                    onChanged: (bool? newValue) {
                      listTileValue = newValue;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
