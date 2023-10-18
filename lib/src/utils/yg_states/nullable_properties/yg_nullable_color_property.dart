import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableColorProperty<T extends Enum> extends YgProperty<T, Color?> {
  const YgNullableColorProperty();

  const factory YgNullableColorProperty.resolveWith(
    YgStatesResolver<T, Color?> resolver,
  ) = _YgNullableColorPropertyResolveWith<T>;

  const factory YgNullableColorProperty.all(
    YgStatesAllResolver<Color?> resolver,
  ) = _YgNullableColorPropertyAll<T>;

  @override
  ColorTween createTween(Color? initialValue) {
    return ColorTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableColorPropertyResolveWith<T extends Enum> extends YgNullableColorProperty<T>
    with YgPropertyResolveWithMixin<T, Color?> {
  const _YgNullableColorPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Color?> resolver;
}

class _YgNullableColorPropertyAll<T extends Enum> extends YgNullableColorProperty<T>
    with YgPropertyResolveAllMixin<T, Color?> {
  const _YgNullableColorPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Color?> resolver;
}
