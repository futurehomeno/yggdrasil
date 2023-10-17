import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgShapeBorderProperty<T extends Enum> extends YgProperty<T, ShapeBorder?> {
  const YgShapeBorderProperty();

  const factory YgShapeBorderProperty.resolveWith(
    YgStatesResolver<T, ShapeBorder?> resolver,
  ) = _YgShapeBorderPropertyResolveWith<T>;

  const factory YgShapeBorderProperty.all(
    YgStatesAllResolver<ShapeBorder?> resolver,
  ) = _YgShapeBorderPropertyAll<T>;

  @override
  ShapeBorderTween createTween(ShapeBorder? initialValue) {
    return ShapeBorderTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgShapeBorderPropertyResolveWith<T extends Enum> extends YgShapeBorderProperty<T>
    with YgPropertyResolveWithMixin<T, ShapeBorder?> {
  const _YgShapeBorderPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, ShapeBorder?> resolver;
}

class _YgShapeBorderPropertyAll<T extends Enum> extends YgShapeBorderProperty<T>
    with YgPropertyResolveAllMixin<T, ShapeBorder?> {
  const _YgShapeBorderPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<ShapeBorder?> resolver;
}
