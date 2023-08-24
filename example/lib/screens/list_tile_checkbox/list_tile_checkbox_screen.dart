import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ListTileCheckboxScreen extends StatefulWidget {
  const ListTileCheckboxScreen({super.key});

  static const String routeName = 'ListTileCheckboxScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ListTileCheckboxScreen(),
    );
  }

  @override
  State<ListTileCheckboxScreen> createState() => _ListTileCheckboxScreenState();
}

class _ListTileCheckboxScreenState extends State<ListTileCheckboxScreen> {
  bool? checkboxListTileValue = false;
  bool? checkboxListTileTriStateValue = false;
  bool? checkboxListTileDisabledValue = false;
  bool? checkboxListTileTrailingWidgetValue = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'CheckboxListTile',
      componentDesc: 'Checkbox list tiles',
      supernovaLink: 'Link',
      child: YgSection.column(
        children: <Widget>[
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
            trailingWidget: YgIconButton(
              onPressed: () {},
              child: const YgIcon(YgIcons.info),
            ),
            value: checkboxListTileTrailingWidgetValue,
            onChanged: (bool? newValue) {
              checkboxListTileTrailingWidgetValue = newValue;
              setState(() {});
            },
          ),
          const YgCallout(
            title: 'Note',
            description:
                'You can also place a Checkbox inside a ListTile manually if you intend for only the Checkbox to be tappable. See the CheckboxScreen for an example.',
          ),
        ],
      ),
    );
  }
}
