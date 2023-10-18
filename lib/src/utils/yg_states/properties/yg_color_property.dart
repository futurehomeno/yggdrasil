import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgColorProperty<T extends Enum> extends YgProperty<T, Color> {
  const YgColorProperty();

  const factory YgColorProperty.resolveWith(
    YgStatesResolver<T, Color> resolver,
  ) = _YgColorPropertyResolveWith<T>;

  const factory YgColorProperty.all(
    YgStatesAllResolver<Color> resolver,
  ) = _YgColorPropertyAll<T>;

  @override
  Tween<Color> createTween(Color initialValue) {
    return ColorTween(
      begin: initialValue,
      end: initialValue,
    ) as Tween<Color>;
  }
}

class _YgColorPropertyResolveWith<T extends Enum> extends YgColorProperty<T> with YgPropertyResolveWithMixin<T, Color> {
  const _YgColorPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Color> resolver;
}

class _YgColorPropertyAll<T extends Enum> extends YgColorProperty<T> with YgPropertyResolveAllMixin<T, Color> {
  const _YgColorPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Color> resolver;
}
