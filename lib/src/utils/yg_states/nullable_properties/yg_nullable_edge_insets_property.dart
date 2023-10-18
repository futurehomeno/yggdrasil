import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableEdgeInsetsProperty<T extends Enum> extends YgProperty<T, EdgeInsets?> {
  const YgNullableEdgeInsetsProperty();

  const factory YgNullableEdgeInsetsProperty.resolveWith(
    YgStatesResolver<T, EdgeInsets?> resolver,
  ) = _YgNullableEdgeInsetsPropertyResolveWith<T>;

  const factory YgNullableEdgeInsetsProperty.all(
    YgStatesAllResolver<EdgeInsets?> resolver,
  ) = _YgNullableEdgeInsetsPropertyAll<T>;

  @override
  EdgeInsetsTween createTween(EdgeInsets? initialValue) {
    return EdgeInsetsTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableEdgeInsetsPropertyResolveWith<T extends Enum> extends YgNullableEdgeInsetsProperty<T>
    with YgPropertyResolveWithMixin<T, EdgeInsets?> {
  const _YgNullableEdgeInsetsPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, EdgeInsets?> resolver;
}

class _YgNullableEdgeInsetsPropertyAll<T extends Enum> extends YgNullableEdgeInsetsProperty<T>
    with YgPropertyResolveAllMixin<T, EdgeInsets?> {
  const _YgNullableEdgeInsetsPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<EdgeInsets?> resolver;
}
