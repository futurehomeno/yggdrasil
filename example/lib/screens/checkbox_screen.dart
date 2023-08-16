import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  static const String routeName = 'CheckboxScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const CheckboxScreen(),
    );
  }

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool? binaryValue = false;
  bool? triStateValue = false;
  bool? errorValue = false;

  bool? checkboxItem = false;
  bool? checkboxItemWithDescription = false;
  bool? checkboxGroup1 = false;
  bool? checkboxGroup2 = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Checkbox',
      componentDesc: 'Checkboxes',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Binary checkbox'),
          YgCheckbox(
            value: binaryValue,
            onChanged: (bool? newValue) {
              binaryValue = newValue;
              setState(() {});
            },
          ),
          const YgListTile(title: 'Tri-state checkbox'),
          YgCheckbox(
            value: triStateValue,
            triState: true,
            onChanged: (bool? newValue) {
              triStateValue = newValue;
              setState(() {});
            },
          ),
          const YgListTile(title: 'Error checkbox'),
          YgCheckbox(
            value: errorValue,
            onChanged: (bool? newValue) {
              errorValue = newValue;
              setState(() {});
            },
            hasError: true,
          ),
          const YgListTile(title: 'Disabled checkbox, selected / unselected'),
          const YgCheckbox(
            value: true,
            onChanged: null,
          ),
          const YgCheckbox(
            value: false,
            onChanged: null,
          ),
          const YgListTile(title: 'Checkbox item'),
          YgCheckboxItem(
            title: 'Some title',
            checkbox: YgCheckbox(
              value: checkboxItem,
              onChanged: (bool? newValue) {
                checkboxItem = newValue;
                setState(() {});
              },
            ),
          ),
          const YgListTile(title: 'Checkbox group'),
          YgCheckboxGroup(
            label: 'Some label',
            checkboxItems: <YgCheckboxItem>[
              YgCheckboxItem(
                title: 'Some title',
                checkbox: YgCheckbox(
                  value: checkboxGroup1,
                  onChanged: (bool? newValue) {
                    checkboxGroup1 = newValue;
                    setState(() {});
                  },
                ),
              ),
              YgCheckboxItem(
                title: 'Some title',
                checkbox: YgCheckbox(
                  value: checkboxGroup2,
                  onChanged: (bool? newValue) {
                    checkboxGroup2 = newValue;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ].withVerticalSpacing(10),
      ),
    );
  }
}
