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
    return DemoScreen(
      componentName: 'Picker',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Single column picker',
            child: YgPicker.single<int>(
              entries: createEntries(20),
              onChange: (int value) {},
            ),
          ),
          YgSection(
            title: 'Multi column picker',
            child: _buildDatePicker(),
          ),
          YgSection(
            title: 'Picker with a metric',
            child: YgPicker.single<int>(
              entries: createEntries(32),
              onChange: (int value) {},
              metric: 'A',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    const List<String> months = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final DateTime date = DateTime.now();

    return YgPicker(
      columns: <YgPickerColumn<Object?>>[
        YgPickerColumn<String>(
          onChange: (Object? value) {},
          entries: months
              .map(
                (String month) => YgPickerEntry<String>(
                  title: month,
                  value: month,
                ),
              )
              .toList(),
          initialValue: months[date.month - 1],
        ),
        YgPickerColumn<int>(
          onChange: (Object? value) {},
          entries: createEntries(31),
          initialValue: date.day - 1,
        ),
        YgPickerColumn<int>(
          onChange: (Object? value) {},
          entries: createEntries(100, 2000),
          initialValue: date.year - 2000,
        ),
      ],
    );
  }

  List<YgPickerEntry<int>> createEntries(int amount, [int offset = 1]) {
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
