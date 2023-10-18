import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableRectProperty<T extends Enum> extends YgProperty<T, Rect?> {
  const YgNullableRectProperty();

  const factory YgNullableRectProperty.resolveWith(
    YgStatesResolver<T, Rect?> resolver,
  ) = _YgNullableRectPropertyResolveWith<T>;

  const factory YgNullableRectProperty.all(
    YgStatesAllResolver<Rect?> resolver,
  ) = _YgNullableRectPropertyAll<T>;

  @override
  RectTween createTween(Rect? initialValue) {
    return RectTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableRectPropertyResolveWith<T extends Enum> extends YgNullableRectProperty<T>
    with YgPropertyResolveWithMixin<T, Rect?> {
  const _YgNullableRectPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Rect?> resolver;
}

class _YgNullableRectPropertyAll<T extends Enum> extends YgNullableRectProperty<T>
    with YgPropertyResolveAllMixin<T, Rect?> {
  const _YgNullableRectPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Rect?> resolver;
}
