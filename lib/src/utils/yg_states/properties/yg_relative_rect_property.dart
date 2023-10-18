import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgRelativeRectProperty<T extends Enum> extends YgProperty<T, RelativeRect> {
  const YgRelativeRectProperty();

  const factory YgRelativeRectProperty.resolveWith(
    YgStatesResolver<T, RelativeRect> resolver,
  ) = _YgRelativeRectPropertyResolveWith<T>;

  const factory YgRelativeRectProperty.all(
    YgStatesAllResolver<RelativeRect> resolver,
  ) = _YgRelativeRectPropertyAll<T>;

  @override
  Tween<RelativeRect> createTween(RelativeRect initialValue) {
    return RelativeRectTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgRelativeRectPropertyResolveWith<T extends Enum> extends YgRelativeRectProperty<T>
    with YgPropertyResolveWithMixin<T, RelativeRect> {
  const _YgRelativeRectPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, RelativeRect> resolver;
}

class _YgRelativeRectPropertyAll<T extends Enum> extends YgRelativeRectProperty<T>
    with YgPropertyResolveAllMixin<T, RelativeRect> {
  const _YgRelativeRectPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<RelativeRect> resolver;
}
