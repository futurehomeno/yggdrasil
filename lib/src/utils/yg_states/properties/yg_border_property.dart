import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgBorderProperty<T extends Enum> extends YgProperty<T, Border> {
  const YgBorderProperty();

  const factory YgBorderProperty.resolveWith(
    YgStatesResolver<T, Border> resolver,
  ) = _YgBorderPropertyResolveWith<T>;

  const factory YgBorderProperty.all(
    YgStatesAllResolver<Border> resolver,
  ) = _YgBorderPropertyAll<T>;

  @override
  Tween<Border> createTween(Border initialValue) {
    return BorderTween(
      begin: initialValue,
      end: initialValue,
    ) as Tween<Border>;
  }
}

class _YgBorderPropertyResolveWith<T extends Enum> extends YgBorderProperty<T>
    with YgPropertyResolveWithMixin<T, Border> {
  const _YgBorderPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Border> resolver;
}

class _YgBorderPropertyAll<T extends Enum> extends YgBorderProperty<T> with YgPropertyResolveAllMixin<T, Border> {
  const _YgBorderPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Border> resolver;
}
