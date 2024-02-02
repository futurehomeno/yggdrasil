import 'package:flutter/material.dart';

import 'widgets/_widgets.dart';

class YgPickerController<T extends Object> extends ChangeNotifier implements ValueNotifier<T> {
  YgPickerController({
    T? initialValue,
  }) : _value = initialValue;

  final T? _value;

  @override
  T get value => throw UnimplementedError();

  @override
  set value(T newValue) {}

  void attach(YgPickerColumnWidgetState<T> state) {}

  void detach(YgPickerColumnWidgetState<T> state) {}
}
