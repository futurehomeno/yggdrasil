import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableTextStyleProperty<T extends Enum> extends YgProperty<T, TextStyle?> {
  const YgNullableTextStyleProperty();

  const factory YgNullableTextStyleProperty.resolveWith(
    YgStatesResolver<T, TextStyle?> resolver,
  ) = _YgNullableTextStylePropertyResolveWith<T>;

  const factory YgNullableTextStyleProperty.all(
    YgStatesAllResolver<TextStyle?> resolver,
  ) = _YgNullableTextStylePropertyAll<T>;

  @override
  TextStyleTween createTween(TextStyle? initialValue) {
    return TextStyleTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableTextStylePropertyResolveWith<T extends Enum> extends YgNullableTextStyleProperty<T>
    with YgPropertyResolveWithMixin<T, TextStyle?> {
  const _YgNullableTextStylePropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, TextStyle?> resolver;
}

class _YgNullableTextStylePropertyAll<T extends Enum> extends YgNullableTextStyleProperty<T>
    with YgPropertyResolveAllMixin<T, TextStyle?> {
  const _YgNullableTextStylePropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<TextStyle?> resolver;
}
