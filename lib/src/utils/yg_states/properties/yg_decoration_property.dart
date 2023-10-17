import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgDecorationProperty<T extends Enum> extends YgProperty<T, Decoration?> {
  const YgDecorationProperty();

  const factory YgDecorationProperty.resolveWith(
    YgStatesResolver<T, Decoration?> resolver,
  ) = _YgDecorationPropertyResolveWith<T>;

  const factory YgDecorationProperty.all(
    YgStatesAllResolver<Decoration?> resolver,
  ) = _YgDecorationPropertyAll<T>;

  @override
  DecorationTween createTween(Decoration? initialValue) {
    return DecorationTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgDecorationPropertyResolveWith<T extends Enum> extends YgDecorationProperty<T>
    with YgPropertyResolveWithMixin<T, Decoration?> {
  const _YgDecorationPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Decoration?> resolver;
}

class _YgDecorationPropertyAll<T extends Enum> extends YgDecorationProperty<T>
    with YgPropertyResolveAllMixin<T, Decoration?> {
  const _YgDecorationPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Decoration?> resolver;
}
