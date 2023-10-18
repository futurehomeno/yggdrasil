import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgRectProperty<T extends Enum> extends YgProperty<T, Rect> {
  const YgRectProperty();

  const factory YgRectProperty.resolveWith(
    YgStatesResolver<T, Rect> resolver,
  ) = _YgRectPropertyResolveWith<T>;

  const factory YgRectProperty.all(
    YgStatesAllResolver<Rect> resolver,
  ) = _YgRectPropertyAll<T>;

  @override
  Tween<Rect> createTween(Rect initialValue) {
    return RectTween(
      begin: initialValue,
      end: initialValue,
    ) as Tween<Rect>;
  }
}

class _YgRectPropertyResolveWith<T extends Enum> extends YgRectProperty<T> with YgPropertyResolveWithMixin<T, Rect> {
  const _YgRectPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Rect> resolver;
}

class _YgRectPropertyAll<T extends Enum> extends YgRectProperty<T> with YgPropertyResolveAllMixin<T, Rect> {
  const _YgRectPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Rect> resolver;
}
