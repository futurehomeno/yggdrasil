/// An entry of a [YgPicker] column.
class YgPickerEntry<T extends Object> {
  const YgPickerEntry({
    required this.title,
    required this.value,
  });

  /// The value passed to the [YgPickerColumn.onChange] method.
  final T value;

  /// Title representing the value.
  final String title;
}
