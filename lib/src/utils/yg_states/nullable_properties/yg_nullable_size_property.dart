import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableSizeProperty<T extends Enum> extends YgProperty<T, Size?> {
  const YgNullableSizeProperty();

  const factory YgNullableSizeProperty.resolveWith(
    YgStatesResolver<T, Size?> resolver,
  ) = _YgNullableSizePropertyResolveWith<T>;

  const factory YgNullableSizeProperty.all(
    YgStatesAllResolver<Size?> resolver,
  ) = _YgNullableSizePropertyAll<T>;

  @override
  SizeTween createTween(Size? initialValue) {
    return SizeTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableSizePropertyResolveWith<T extends Enum> extends YgNullableSizeProperty<T>
    with YgPropertyResolveWithMixin<T, Size?> {
  const _YgNullableSizePropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Size?> resolver;
}

class _YgNullableSizePropertyAll<T extends Enum> extends YgNullableSizeProperty<T>
    with YgPropertyResolveAllMixin<T, Size?> {
  const _YgNullableSizePropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Size?> resolver;
}
