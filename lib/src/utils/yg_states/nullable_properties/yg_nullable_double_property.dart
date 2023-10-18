import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableDoubleProperty<T extends Enum> extends YgProperty<T, double?> {
  const YgNullableDoubleProperty();

  const factory YgNullableDoubleProperty.resolveWith(
    YgStatesResolver<T, double?> resolver,
  ) = _YgNullableDoublePropertyResolveWith<T>;

  const factory YgNullableDoubleProperty.all(
    YgStatesAllResolver<double?> resolver,
  ) = _YgNullableDoublePropertyAll<T>;

  @override
  Tween<double> createTween(double? initialValue) {
    return Tween<double>(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableDoublePropertyResolveWith<T extends Enum> extends YgNullableDoubleProperty<T>
    with YgPropertyResolveWithMixin<T, double?> {
  const _YgNullableDoublePropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, double?> resolver;
}

class _YgNullableDoublePropertyAll<T extends Enum> extends YgNullableDoubleProperty<T>
    with YgPropertyResolveAllMixin<T, double?> {
  const _YgNullableDoublePropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<double?> resolver;
}
