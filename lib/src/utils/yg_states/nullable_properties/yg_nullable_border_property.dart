import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableBorderProperty<T extends Enum> extends YgProperty<T, Border?> {
  const YgNullableBorderProperty();

  const factory YgNullableBorderProperty.resolveWith(
    YgStatesResolver<T, Border?> resolver,
  ) = _YgNullableBorderPropertyResolveWith<T>;

  const factory YgNullableBorderProperty.all(
    YgStatesAllResolver<Border?> resolver,
  ) = _YgNullableBorderPropertyAll<T>;

  @override
  BorderTween createTween(Border? initialValue) {
    return BorderTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableBorderPropertyResolveWith<T extends Enum> extends YgNullableBorderProperty<T>
    with YgPropertyResolveWithMixin<T, Border?> {
  const _YgNullableBorderPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Border?> resolver;
}

class _YgNullableBorderPropertyAll<T extends Enum> extends YgNullableBorderProperty<T>
    with YgPropertyResolveAllMixin<T, Border?> {
  const _YgNullableBorderPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Border?> resolver;
}
