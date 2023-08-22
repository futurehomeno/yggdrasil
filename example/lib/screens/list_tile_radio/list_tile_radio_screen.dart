import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ListTileRadioScreen extends StatefulWidget {
  const ListTileRadioScreen({super.key});

  static const String routeName = 'ListTileRadioScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ListTileRadioScreen(),
    );
  }

  @override
  State<ListTileRadioScreen> createState() => _ListTileRadioScreenState();
}

class _ListTileRadioScreenState extends State<ListTileRadioScreen> {
  int radioGroupValue = 1;
  int disabledRadioGroupValue = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ListTile - Radio',
      componentDesc: 'Radio list tiles',
      supernovaLink: 'Link',
      child: YgSectionColumn(
        children: <Widget>[
          YgRadioListTile<int>(
            title: 'RadioListTile',
            subtitle: 'The whole ListTile and Radio is tappable.',
            value: 1,
            groupValue: radioGroupValue,
            onChanged: (int? newValue) {
              radioGroupValue = newValue!;
              setState(() {});
            },
          ),
          YgRadioListTile<int>(
            title: 'Disabled RadioListTile',
            subtitle: 'Tapping anywhere does nothing.',
            value: 2,
            groupValue: disabledRadioGroupValue,
            onChanged: null,
          ),
          YgRadioListTile<int>(
            title: 'With trailingWidget',
            subtitle: 'Mostly used to add a YgIconButton.',
            trailingWidget: YgIconButton(
              onPressed: () {},
              child: const YgIcon(YgIcons.info),
            ),
            value: 3,
            groupValue: radioGroupValue,
            onChanged: (int? newValue) {
              radioGroupValue = newValue!;
              setState(() {});
            },
          ),
          const YgCallout(
            title: 'Note',
            description:
                'You can also place a Radio inside a ListTile manually if you intend for only the Radio to be tappable. See the RadioScreen for an example.',
          ),
        ],
      ),
    );
  }
}
