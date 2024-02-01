import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

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
    const int rows = 5;

    return DemoScreen(
      componentName: 'Picker',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Picker',
            child: YgPicker<int>(
              metric: 'A',
              columns: <List<YgPickerEntry<int>>>[
                List<YgPickerEntry<int>>.generate(
                  10,
                  (int index) => YgPickerEntry<int>(
                    title: index.toString(),
                    value: index,
                  ),
                ),
                List<YgPickerEntry<int>>.generate(
                  10,
                  (int index) => YgPickerEntry<int>(
                    title: index.toString(),
                    value: index,
                  ),
                ),
                List<YgPickerEntry<int>>.generate(
                  10,
                  (int index) => YgPickerEntry<int>(
                    title: index.toString(),
                    value: index,
                  ),
                ),
              ],
            ),
          ),
          YgSection(
            title: 'Picker',
            child: CupertinoPicker(
              itemExtent: 48,
              onSelectedItemChanged: (int value) {},
              children: List.generate(
                10,
                (int index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    index.toString(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
