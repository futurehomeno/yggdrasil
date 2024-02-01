class YgPickerEntry<T extends Object?> {
  const YgPickerEntry({
    required this.title,
    required this.value,
  });

  final T value;
  final String title;
}
