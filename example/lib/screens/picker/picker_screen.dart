import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'examples/_examples.dart';

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
                  entries: createEntries(20),
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
                  entries: createEntries(20),
                  onChange: (int value) {},
                ),
                YgPickerColumn<int>(
                  entries: createEntries(20),
                  onChange: (int value) {},
                ),
              ],
            ),
          ),
          const YgSection(
            title: 'Triple column picker',
            child: DatePickerExample(),
          ),
          YgSection(
            title: 'Picker with a metric',
            child: YgPicker(
              columns: <YgPickerColumn<Object>>[
                YgPickerColumn<int>(
                  entries: createEntries(32),
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
                  entries: createEntries(3),
                  onChange: (int value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static List<YgPickerEntry<int>> createEntries(int amount, [int offset = 1]) {
    final List<YgPickerEntry<int>> entries = <YgPickerEntry<int>>[];

    for (int i = 0; i < amount; i++) {
      entries.add(YgPickerEntry<int>(
        title: (i + offset).toString(),
        value: i,
      ));
    }

    return entries;
  }
}
