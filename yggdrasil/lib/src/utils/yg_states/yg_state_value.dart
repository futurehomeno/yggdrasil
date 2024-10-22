import 'package:flutter/material.dart';

/// A value to be used in [YgState].
///
/// Notifies its listeners when a new value is set.
class YgStateValue<T> extends ValueNotifier<T> {
  YgStateValue(super._value);

  /// Updates the value.
  ///
  /// Returns true if the value was not identical to the previous value.
  bool update(T value) {
    final bool shouldUpdate = this.value != value;
    if (shouldUpdate) {
      this.value = value;
    }

    return shouldUpdate;
  }
}
