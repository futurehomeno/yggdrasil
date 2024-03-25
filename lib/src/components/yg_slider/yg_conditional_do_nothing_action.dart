import 'package:flutter/material.dart';

class YgConditionalDoNothingAction<T extends Intent> extends Action<T> {
  YgConditionalDoNothingAction({
    required this.condition,
  });

  final bool Function(T intent) condition;

  @override
  bool consumesKey(T intent) => condition(intent);

  @override
  void invoke(T intent) {}
}
