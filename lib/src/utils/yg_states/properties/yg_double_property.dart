import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgDoubleProperty<T extends Enum> extends YgProperty<T, double> {
  const YgDoubleProperty();

  const factory YgDoubleProperty.resolveWith(
    YgStatesResolver<T, double> resolver,
  ) = _YgDoublePropertyResolveWith<T>;

  const factory YgDoubleProperty.all(
    YgStatesAllResolver<double> resolver,
  ) = _YgDoublePropertyAll<T>;

  @override
  Tween<double> createTween(double initialValue) {
    return Tween<double>(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgDoublePropertyResolveWith<T extends Enum> extends YgDoubleProperty<T>
    with YgPropertyResolveWithMixin<T, double> {
  const _YgDoublePropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, double> resolver;
}

class _YgDoublePropertyAll<T extends Enum> extends YgDoubleProperty<T> with YgPropertyResolveAllMixin<T, double> {
  const _YgDoublePropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<double> resolver;
}
