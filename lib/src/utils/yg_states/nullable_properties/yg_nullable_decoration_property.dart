import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableDecorationProperty<T extends Enum> extends YgProperty<T, Decoration?> {
  const YgNullableDecorationProperty();

  const factory YgNullableDecorationProperty.resolveWith(
    YgStatesResolver<T, Decoration?> resolver,
  ) = _YgNullableDecorationPropertyResolveWith<T>;

  const factory YgNullableDecorationProperty.all(
    YgStatesAllResolver<Decoration?> resolver,
  ) = _YgNullableDecorationPropertyAll<T>;

  @override
  DecorationTween createTween(Decoration? initialValue) {
    return DecorationTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableDecorationPropertyResolveWith<T extends Enum> extends YgNullableDecorationProperty<T>
    with YgPropertyResolveWithMixin<T, Decoration?> {
  const _YgNullableDecorationPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Decoration?> resolver;
}

class _YgNullableDecorationPropertyAll<T extends Enum> extends YgNullableDecorationProperty<T>
    with YgPropertyResolveAllMixin<T, Decoration?> {
  const _YgNullableDecorationPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Decoration?> resolver;
}
