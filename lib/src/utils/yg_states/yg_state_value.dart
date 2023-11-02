import 'package:flutter/material.dart';

class YgStateValue<T> extends ValueNotifier<T> {
  YgStateValue(super._value);

  bool update(T value) {
    final bool shouldUpdate = this.value != value;
    if (shouldUpdate) {
      this.value = value;
    }

    return shouldUpdate;
  }
}
