import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  static const String routeName = 'RadioScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
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
  int errorRadioGroupValue = 1;
  int radioItemGroupValue = 1;
  int radioGroupGroupValue = 1;
  int listTileGroupValue = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Radio',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Radio',
            children: <Widget>[
              YgRadio<int>(
                value: 1,
                groupValue: radioGroupValue,
                onChanged: (int newValue) {
                  radioGroupValue = newValue;
                  setState(() {});
                },
              ),
              YgRadio<int>(
                value: 2,
                groupValue: radioGroupValue,
                onChanged: (int newValue) {
                  radioGroupValue = newValue;
                  setState(() {});
                },
              ),
            ],
          ),
          YgSection.column(
            title: 'Disabled radio, selected / unselected',
            children: <Widget>[
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
            ],
          ),
          YgSection.column(
            title: 'With an error',
            children: <Widget>[
              YgRadio<int>(
                value: 1,
                groupValue: errorRadioGroupValue,
                hasError: true,
                onChanged: (int newValue) {
                  errorRadioGroupValue = newValue;
                  setState(() {});
                },
              ),
              YgRadio<int>(
                value: 2,
                groupValue: errorRadioGroupValue,
                hasError: true,
                onChanged: (int newValue) {
                  errorRadioGroupValue = newValue;
                  setState(() {});
                },
              ),
            ],
          ),
          YgSection.column(
            title: 'Radio group',
            children: <Widget>[
              YgRadioGroup<int>(
                label: 'Some label',
                radioItems: <YgRadioItem<int>>[
                  YgRadioItem<int>(
                    title: 'Radio item 1',
                    value: 1,
                    groupValue: radioGroupGroupValue,
                    onChanged: (int newValue) {
                      radioGroupGroupValue = newValue;
                      setState(() {});
                    },
                  ),
                  YgRadioItem<int>(
                    title: 'Radio item 2',
                    value: 2,
                    groupValue: radioGroupGroupValue,
                    onChanged: (int newValue) {
                      radioGroupGroupValue = newValue;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
          const YgSection(
            title: 'Radio in a list tile',
            child: YgCallout(
              variant: YgCalloutVariant.warning,
              description:
                  'You can place a Radio in a list tile as shown below, but consider using RadioListTile instead if you intend for the whole list tile to be tappable.',
            ),
          ),
          YgSection.list(
            children: <YgListTile>[
              YgListTile(
                title: 'Radio in a list tile',
                subtitle: 'Only the Radio is tappable.',
                trailingWidgets: <Widget>[
                  YgRadio<int>(
                    value: 1,
                    groupValue: listTileGroupValue,
                    onChanged: (int newValue) {
                      listTileGroupValue = newValue;
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
