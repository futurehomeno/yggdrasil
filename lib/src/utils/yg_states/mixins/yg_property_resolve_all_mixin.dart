import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Mixin which slightly simplifies implementing a custom property with a
/// all static method.
mixin YgPropertyResolveAllMixin<T extends Enum, V> on YgProperty<T, V> {
  YgStatesAllResolver<V> get resolver;

  @override
  V resolve(BuildContext context, Set<T> states) {
    return resolver(context);
  }
}
