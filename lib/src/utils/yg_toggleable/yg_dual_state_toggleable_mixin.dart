import 'package:flutter/material.dart';

import 'yg_toggleable.dart';

mixin YgDualStateToggleableMixin on Widget implements YgToggleable {
  @override
  bool get value;

  ValueChanged<bool>? get onChanged;

  @override
  bool get enabled => onChanged != null;

  @override
  bool get triState => false;

  @override
  VoidCallback? get toggle {
    if (!enabled) {
      return null;
    }

    return _toggle;
  }

  void _toggle() {
    onChanged?.call(!value);
  }
}
