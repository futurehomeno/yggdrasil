import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A [YgPicker] column.
class YgPickerColumn<T extends Object?> {
  const YgPickerColumn({
    required this.onChange,
    required this.entries,
    this.initialValue,
  });

  /// The initial value selected in the column.
  final T? initialValue;

  /// Called when the value changes.
  final ValueChanged<T> onChange;

  /// All the entries shown in the column.
  final List<YgPickerEntry<T>> entries;
}
