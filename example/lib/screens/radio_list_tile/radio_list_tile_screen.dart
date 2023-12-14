import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class RadioListTileScreen extends StatefulWidget {
  const RadioListTileScreen({super.key});

  static const String routeName = 'RadioListTileScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const RadioListTileScreen(),
    );
  }

  @override
  State<RadioListTileScreen> createState() => RadioListTileScreenState();
}

class RadioListTileScreenState extends State<RadioListTileScreen> {
  int radioGroupValue = 1;
  int disabledRadioGroupValue = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ListTile - Radio',
      child: Column(
        children: <Widget>[
          const YgSection(
            child: YgCallout(
              title: 'Note',
              description:
                  'You can also place a Radio inside a ListTile manually if you intend for only the Radio to be tappable. See the RadioScreen for an example.',
            ),
          ),
          YgSection.list(
            children: <YgListTile>[
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
                leadingWidget: YgIconButton(
                  onPressed: () {},
                  icon: YgIcons.info,
                ),
                value: 3,
                groupValue: radioGroupValue,
                onChanged: (int? newValue) {
                  radioGroupValue = newValue!;
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
