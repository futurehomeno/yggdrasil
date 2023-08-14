import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  static const String routeName = 'RadioScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const RadioScreen(),
    );
  }

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int radioGroupValue = 1;
  int disabledRadioGroupValue = 1;
  int radioItemGroupValue = 1;
  int radioGroupGroupValue = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Radio',
      componentDesc: 'Radios',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Radio'),
          YgRadio<int>(
            value: 1,
            groupValue: radioGroupValue,
            onChanged: (int? newValue) {
              radioGroupValue = newValue!;
              setState(() {});
            },
          ),
          YgRadio<int>(
            value: 2,
            groupValue: radioGroupValue,
            onChanged: (int? newValue) {
              radioGroupValue = newValue!;
              setState(() {});
            },
          ),
          const YgListTile(title: 'Disabled radio, selected / unselected'),
          YgRadio<int>(
            value: 1,
            groupValue: disabledRadioGroupValue,
            onChanged: null,
          ),
          YgRadio<int>(
            value: 2,
            groupValue: disabledRadioGroupValue,
            onChanged: null,
          ),
          const YgListTile(title: 'Radio group'),
          YgRadioGroup<int>(
            label: 'Some label',
            radioItems: <YgRadioItem<int>>[
              YgRadioItem<int>(
                title: 'Radio item 1',
                radio: YgRadio<int>(
                  value: 1,
                  groupValue: radioGroupGroupValue,
                  onChanged: (int? newValue) {
                    radioGroupGroupValue = newValue!;
                    setState(() {});
                  },
                ),
              ),
              YgRadioItem<int>(
                title: 'Radio item 2',
                radio: YgRadio<int>(
                  value: 2,
                  groupValue: radioGroupGroupValue,
                  onChanged: (int? newValue) {
                    radioGroupGroupValue = newValue!;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
