import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgThemeDataProperty<T extends Enum> extends YgProperty<T, ThemeData> {
  const YgThemeDataProperty();

  const factory YgThemeDataProperty.resolveWith(
    YgStatesResolver<T, ThemeData> resolver,
  ) = _YgThemeDataPropertyResolveWith<T>;

  const factory YgThemeDataProperty.all(
    YgStatesAllResolver<ThemeData> resolver,
  ) = _YgThemeDataPropertyAll<T>;

  @override
  Tween<ThemeData> createTween(ThemeData initialValue) {
    return ThemeDataTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgThemeDataPropertyResolveWith<T extends Enum> extends YgThemeDataProperty<T>
    with YgPropertyResolveWithMixin<T, ThemeData> {
  const _YgThemeDataPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, ThemeData> resolver;
}

class _YgThemeDataPropertyAll<T extends Enum> extends YgThemeDataProperty<T>
    with YgPropertyResolveAllMixin<T, ThemeData> {
  const _YgThemeDataPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<ThemeData> resolver;
}
