import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  static const String routeName = 'CheckboxScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const CheckboxScreen(),
    );
  }

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool binaryValue = false;
  bool? binaryNoInitialValue;
  bool? triStateValue = false;
  bool errorValue = false;

  bool checkboxItem = false;
  bool checkboxItemWithDescription = false;
  bool checkboxGroup1 = false;
  bool checkboxGroup2 = false;

  bool listTileValue = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Checkbox',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Binary checkbox',
            child: YgCheckbox(
              value: binaryValue,
              onChanged: (bool newValue) {
                binaryValue = newValue;
                setState(() {});
              },
            ),
          ),
          YgSection(
            title: 'Binary checkbox without initial value',
            child: YgCheckbox(
              value: binaryNoInitialValue,
              onChanged: (bool newValue) {
                binaryNoInitialValue = newValue;
                setState(() {});
              },
            ),
          ),
          YgSection(
            title: 'Tri-state checkbox',
            child: YgCheckbox.triState(
              value: triStateValue,
              onChanged: (bool? newValue) {
                triStateValue = newValue;
                setState(() {});
              },
            ),
          ),
          YgSection(
            title: 'Error checkbox',
            child: YgCheckbox(
              value: errorValue,
              onChanged: (bool newValue) {
                errorValue = newValue;
                setState(() {});
              },
              hasError: true,
            ),
          ),
          const YgSection(
            title: 'Disabled checkbox, selected / unselected / indeterminate',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgCheckbox(
                  value: false,
                  onChanged: null,
                ),
                YgCheckbox(
                  value: true,
                  onChanged: null,
                ),
                YgCheckbox.triState(
                  value: null,
                  onChanged: null,
                ),
              ],
            ),
          ),
          YgSection(
            title: 'Checkbox item',
            child: YgCheckboxItem(
              title: 'Some title',
              value: checkboxItem,
              onChanged: (bool newValue) {
                checkboxItem = newValue;
                setState(() {});
              },
            ),
          ),
          YgSection(
            title: 'Checkbox group',
            child: YgCheckboxGroup(
              label: 'Some label',
              checkboxItems: <YgCheckboxItem>[
                YgCheckboxItem(
                  title: 'Some title',
                  value: checkboxGroup1,
                  onChanged: (bool newValue) {
                    checkboxGroup1 = newValue;
                    setState(() {});
                  },
                ),
                YgCheckboxItem(
                  title: 'Some title',
                  value: checkboxGroup2,
                  onChanged: (bool newValue) {
                    checkboxGroup2 = newValue;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          const YgSection(
            title: 'Checkbox in a list tile',
            child: YgCallout(
              variant: YgCalloutVariant.warning,
              description:
                  'You can place a Checkbox in a list tile as shown below, but consider using CheckboxListTile instead if you intend for the whole list tile to be tappable.',
            ),
          ),
          YgSection.list(
            children: <Widget>[
              YgListTile(
                title: 'Checkbox in a list tile',
                subtitle: 'Only the Checkbox is tappable.',
                trailingWidgets: <Widget>[
                  YgCheckbox(
                    value: listTileValue,
                    onChanged: (bool newValue) {
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
