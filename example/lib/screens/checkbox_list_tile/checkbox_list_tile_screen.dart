import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class CheckboxListTileScreen extends StatefulWidget {
  const CheckboxListTileScreen({super.key});

  static const String routeName = 'CheckboxListTileScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const CheckboxListTileScreen(),
    );
  }

  @override
  State<CheckboxListTileScreen> createState() => CheckboxListTileScreenState();
}

class CheckboxListTileScreenState extends State<CheckboxListTileScreen> {
  bool? checkboxListTileValue = false;
  bool? checkboxListTileTriStateValue = false;
  bool? checkboxListTileDisabledValue = false;
  bool? checkboxListTileTrailingWidgetValue = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'CheckboxListTile',
      child: Column(
        children: <Widget>[
          const YgSection(
            child: YgCallout(
              title: 'Note',
              description:
                  'You can also place a Checkbox inside a ListTile manually if you intend for only the Checkbox to be tappable. See the CheckboxScreen for an example.',
            ),
          ),
          YgSection.list(
            children: <YgListTile>[
              YgCheckboxListTile(
                title: 'CheckboxListTile',
                subtitle: 'The whole ListTile and Checkbox is tappable.',
                value: checkboxListTileValue,
                onChanged: (bool? newValue) {
                  checkboxListTileValue = newValue;
                  setState(() {});
                },
              ),
              YgCheckboxListTile(
                title: 'Tri-state CheckboxListTile',
                subtitle: 'The whole ListTile and Checkbox is tappable.',
                value: checkboxListTileTriStateValue,
                triState: true,
                onChanged: (bool? newValue) {
                  checkboxListTileTriStateValue = newValue;
                  setState(() {});
                },
              ),
              YgCheckboxListTile(
                title: 'Disabled CheckboxListTile',
                subtitle: 'Tapping anywhere does nothing.',
                value: checkboxListTileDisabledValue,
                onChanged: null,
              ),
              YgCheckboxListTile(
                title: 'With trailingWidget',
                subtitle: 'Mostly used to add a YgIconButton.',
                leadingWidget: YgIconButton(
                  onPressed: () {},
                  child: const YgIcon(YgIcons.info),
                ),
                value: checkboxListTileTrailingWidgetValue,
                onChanged: (bool? newValue) {
                  checkboxListTileTrailingWidgetValue = newValue;
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
