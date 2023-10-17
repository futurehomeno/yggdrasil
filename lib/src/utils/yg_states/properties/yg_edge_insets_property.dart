import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgEdgeInsetsProperty<T extends Enum> extends YgProperty<T, EdgeInsets?> {
  const YgEdgeInsetsProperty();

  const factory YgEdgeInsetsProperty.resolveWith(
    YgStatesResolver<T, EdgeInsets?> resolver,
  ) = _YgEdgeInsetsPropertyResolveWith<T>;

  const factory YgEdgeInsetsProperty.all(
    YgStatesAllResolver<EdgeInsets?> resolver,
  ) = _YgEdgeInsetsPropertyAll<T>;

  @override
  EdgeInsetsTween createTween(EdgeInsets? initialValue) {
    return EdgeInsetsTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgEdgeInsetsPropertyResolveWith<T extends Enum> extends YgEdgeInsetsProperty<T>
    with YgPropertyResolveWithMixin<T, EdgeInsets?> {
  const _YgEdgeInsetsPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, EdgeInsets?> resolver;
}

class _YgEdgeInsetsPropertyAll<T extends Enum> extends YgEdgeInsetsProperty<T>
    with YgPropertyResolveAllMixin<T, EdgeInsets?> {
  const _YgEdgeInsetsPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<EdgeInsets?> resolver;
}
