import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../picker_screen.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  final YgPickerColumnController<String> _monthController = YgPickerColumnController<String>(
    initialValue: _months[DateTime.now().month - 1],
  );
  final YgPickerColumnController<int> _dayController = YgPickerColumnController<int>(
    initialValue: DateTime.now().day - 1,
  );
  final YgPickerColumnController<int> _yearController = YgPickerColumnController<int>(
    initialValue: DateTime.now().year - 2000,
  );

  @override
  void dispose() {
    _monthController.dispose();
    _dayController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  static const List<String> _months = <String>[
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

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();

    return YgPicker(
      columns: <YgPickerColumn<Object>>[
        YgPickerColumn<String>(
          onChange: (String value) {},
          entries: _months
              .map(
                (String month) => YgPickerEntry<String>(
                  title: month,
                  value: month,
                ),
              )
              .toList(),
          looping: true,
          controller: _monthController,
          onRollover: (int direction) {
            if (direction > 0) {
              _yearController.next();
            } else {
              _yearController.previous();
            }
          },
        ),
        YgPickerColumn<int>(
          onChange: (int value) {},
          entries: PickerScreen.createEntries(31),
          initialValue: date.day - 1,
          controller: _dayController,
          looping: true,
          onRollover: (int direction) {
            if (direction > 0) {
              _monthController.next();
            } else {
              _monthController.previous();
            }
          },
        ),
        YgPickerColumn<int>(
          onChange: (int value) {},
          entries: PickerScreen.createEntries(100, 2000),
          initialValue: date.year - 2000,
          controller: _yearController,
        ),
      ],
    );
  }
}
