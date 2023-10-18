import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgSizeProperty<T extends Enum> extends YgProperty<T, Size> {
  const YgSizeProperty();

  const factory YgSizeProperty.resolveWith(
    YgStatesResolver<T, Size> resolver,
  ) = _YgSizePropertyResolveWith<T>;

  const factory YgSizeProperty.all(
    YgStatesAllResolver<Size> resolver,
  ) = _YgSizePropertyAll<T>;

  @override
  Tween<Size> createTween(Size initialValue) {
    return SizeTween(
      begin: initialValue,
      end: initialValue,
    ) as Tween<Size>;
  }
}

class _YgSizePropertyResolveWith<T extends Enum> extends YgSizeProperty<T> with YgPropertyResolveWithMixin<T, Size> {
  const _YgSizePropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Size> resolver;
}

class _YgSizePropertyAll<T extends Enum> extends YgSizeProperty<T> with YgPropertyResolveAllMixin<T, Size> {
  const _YgSizePropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Size> resolver;
}
