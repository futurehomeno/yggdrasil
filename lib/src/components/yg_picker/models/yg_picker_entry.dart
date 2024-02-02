/// An entry of a [YgPicker] column.
class YgPickerEntry<T extends Object> {
  const YgPickerEntry({
    required this.title,
    required this.value,
  });

  /// The value passed to the [YgPickerColumn.onChange] method.
  final T value;

  /// The title rendered on screen.
  final String title;
}
