import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgPickerColumn<T extends Object?> {
  const YgPickerColumn({
    required this.onChange,
    required this.entries,
    this.initialValue,
  });

  final T? initialValue;
  final ValueChanged<T> onChange;
  final List<YgPickerEntry<T>> entries;
}
