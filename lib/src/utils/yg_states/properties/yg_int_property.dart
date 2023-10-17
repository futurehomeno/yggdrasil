import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgIntProperty<T extends Enum> extends YgProperty<T, int?> {
  const YgIntProperty();

  const factory YgIntProperty.resolveWith(
    YgStatesResolver<T, int?> resolver,
  ) = _YgIntPropertyResolveWith<T>;

  const factory YgIntProperty.all(
    YgStatesAllResolver<int?> resolver,
  ) = _YgIntPropertyAll<T>;

  @override
  IntTween createTween(int? initialValue) {
    return IntTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgIntPropertyResolveWith<T extends Enum> extends YgIntProperty<T> with YgPropertyResolveWithMixin<T, int?> {
  const _YgIntPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, int?> resolver;
}

class _YgIntPropertyAll<T extends Enum> extends YgIntProperty<T> with YgPropertyResolveAllMixin<T, int?> {
  const _YgIntPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<int?> resolver;
}
