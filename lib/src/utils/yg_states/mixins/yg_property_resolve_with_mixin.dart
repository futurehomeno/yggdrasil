import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Mixin which slightly simplifies implementing a custom property with a
/// resolveWith static method.
mixin YgPropertyResolveWithMixin<T extends YgState, V> on YgProperty<T, V> {
  YgStatesResolver<T, V> get resolver;

  @override
  V resolve(BuildContext context, T states) {
    return resolver(context, states);
  }
}
