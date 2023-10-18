import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableShapeBorderProperty<T extends Enum> extends YgProperty<T, ShapeBorder?> {
  const YgNullableShapeBorderProperty();

  const factory YgNullableShapeBorderProperty.resolveWith(
    YgStatesResolver<T, ShapeBorder?> resolver,
  ) = _YgNullableShapeBorderPropertyResolveWith<T>;

  const factory YgNullableShapeBorderProperty.all(
    YgStatesAllResolver<ShapeBorder?> resolver,
  ) = _YgNullableShapeBorderPropertyAll<T>;

  @override
  ShapeBorderTween createTween(ShapeBorder? initialValue) {
    return ShapeBorderTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableShapeBorderPropertyResolveWith<T extends Enum> extends YgNullableShapeBorderProperty<T>
    with YgPropertyResolveWithMixin<T, ShapeBorder?> {
  const _YgNullableShapeBorderPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, ShapeBorder?> resolver;
}

class _YgNullableShapeBorderPropertyAll<T extends Enum> extends YgNullableShapeBorderProperty<T>
    with YgPropertyResolveAllMixin<T, ShapeBorder?> {
  const _YgNullableShapeBorderPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<ShapeBorder?> resolver;
}
