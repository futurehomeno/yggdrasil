import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableThemeDataProperty<T extends Enum> extends YgProperty<T, ThemeData?> {
  const YgNullableThemeDataProperty();

  const factory YgNullableThemeDataProperty.resolveWith(
    YgStatesResolver<T, ThemeData?> resolver,
  ) = _YgNullableThemeDataPropertyResolveWith<T>;

  const factory YgNullableThemeDataProperty.all(
    YgStatesAllResolver<ThemeData?> resolver,
  ) = _YgNullableThemeDataPropertyAll<T>;

  @override
  ThemeDataTween createTween(ThemeData? initialValue) {
    return ThemeDataTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableThemeDataPropertyResolveWith<T extends Enum> extends YgNullableThemeDataProperty<T>
    with YgPropertyResolveWithMixin<T, ThemeData?> {
  const _YgNullableThemeDataPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, ThemeData?> resolver;
}

class _YgNullableThemeDataPropertyAll<T extends Enum> extends YgNullableThemeDataProperty<T>
    with YgPropertyResolveAllMixin<T, ThemeData?> {
  const _YgNullableThemeDataPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<ThemeData?> resolver;
}
