part of 'yg_picker.dart';

class _YgPickerSingleColumn<T> extends YgPicker {
  const _YgPickerSingleColumn({
    super.key,
    super.metric,
    required this.entries,
    required this.onChange,
    this.initialValue,
  }) : super._();

  /// The initial value selected in the column.
  final T? initialValue;

  /// Called when the value changes.
  final ValueChanged<T> onChange;

  /// All the entries shown in the column.
  final List<YgPickerEntry<T>> entries;

  @override
  List<YgPickerColumn<Object?>> get columns => <YgPickerColumn<Object?>>[
        YgPickerColumn<T>(
          entries: entries,
          onChange: onChange,
          initialValue: initialValue,
        ),
      ];
}
