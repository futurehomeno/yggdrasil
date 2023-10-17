import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgTextStyleProperty<T extends Enum> extends YgProperty<T, TextStyle?> {
  const YgTextStyleProperty();

  const factory YgTextStyleProperty.resolveWith(
    YgStatesResolver<T, TextStyle?> resolver,
  ) = _YgTextStylePropertyResolveWith<T>;

  const factory YgTextStyleProperty.all(
    YgStatesAllResolver<TextStyle?> resolver,
  ) = _YgTextStylePropertyAll<T>;

  @override
  TextStyleTween createTween(TextStyle? initialValue) {
    return TextStyleTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgTextStylePropertyResolveWith<T extends Enum> extends YgTextStyleProperty<T>
    with YgPropertyResolveWithMixin<T, TextStyle?> {
  const _YgTextStylePropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, TextStyle?> resolver;
}

class _YgTextStylePropertyAll<T extends Enum> extends YgTextStyleProperty<T>
    with YgPropertyResolveAllMixin<T, TextStyle?> {
  const _YgTextStylePropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<TextStyle?> resolver;
}
