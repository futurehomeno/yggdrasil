import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'examples/_examples.dart';
import 'picker_example_helpers.dart';

class PickerScreen extends StatelessWidget {
  const PickerScreen({super.key});

  static const String routeName = 'PickerScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const PickerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Picker',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Single column picker',
            child: YgPicker(
              columns: <YgPickerColumn<Object>>[
                YgPickerColumn<int>(
                  entries: PickerExampleHelpers.createEntries(20),
                  onChange: (int value) {},
                ),
              ],
            ),
          ),
          YgSection(
            title: 'Dual column picker',
            child: YgPicker(
              columns: <YgPickerColumn<Object>>[
                YgPickerColumn<int>(
                  entries: PickerExampleHelpers.createEntries(20),
                  onChange: (int value) {},
                ),
                YgPickerColumn<int>(
                  entries: PickerExampleHelpers.createEntries(20),
                  onChange: (int value) {},
                ),
              ],
            ),
          ),
          const YgSection(
            title: 'Triple column date picker',
            subtitle: 'Uses controllers to modify the value and listens for rollover events.',
            child: DatePickerExample(),
          ),
          YgSection(
            title: 'Picker with a metric',
            child: YgPicker(
              columns: <YgPickerColumn<Object>>[
                YgPickerColumn<int>(
                  entries: PickerExampleHelpers.createEntries(32),
                  onChange: (int value) {},
                ),
              ],
              metric: 'A',
            ),
          ),
          YgSection(
            title: 'Single column picker with less than 4 items',
            child: YgPicker(
              columns: <YgPickerColumn<Object>>[
                YgPickerColumn<int>(
                  entries: PickerExampleHelpers.createEntries(3),
                  onChange: (int value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
