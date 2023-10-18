import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgStepProperty<T extends Enum> extends YgProperty<T, int> {
  const YgStepProperty();

  const factory YgStepProperty.resolveWith(
    YgStatesResolver<T, int> resolver,
  ) = _YgStepPropertyResolveWith<T>;

  const factory YgStepProperty.all(
    YgStatesAllResolver<int> resolver,
  ) = _YgStepPropertyAll<T>;

  @override
  Tween<int> createTween(int initialValue) {
    return StepTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgStepPropertyResolveWith<T extends Enum> extends YgStepProperty<T> with YgPropertyResolveWithMixin<T, int> {
  const _YgStepPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, int> resolver;
}

class _YgStepPropertyAll<T extends Enum> extends YgStepProperty<T> with YgPropertyResolveAllMixin<T, int> {
  const _YgStepPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<int> resolver;
}
