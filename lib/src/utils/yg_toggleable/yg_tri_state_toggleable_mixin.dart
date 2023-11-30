import 'package:flutter/material.dart';

import 'yg_toggleable.dart';

mixin YgTriStateToggleableMixin on Widget implements YgToggleable {
  @override
  bool? get value;

  ValueChanged<bool?>? get onChanged;

  @override
  bool get disabled => onChanged == null;

  @override
  bool get triState => true;

  @override
  VoidCallback? get toggle {
    if (disabled) {
      return null;
    }

    return _toggle;
  }

  void _toggle() {
    onChanged?.call(switch (value) {
      false => true,
      true => null,
      null => false,
    });
  }
}
