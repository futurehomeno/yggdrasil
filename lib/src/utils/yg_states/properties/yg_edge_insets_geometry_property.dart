import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgEdgeInsetsGeometryProperty<T extends Enum> extends YgProperty<T, EdgeInsetsGeometry> {
  const YgEdgeInsetsGeometryProperty();

  const factory YgEdgeInsetsGeometryProperty.resolveWith(
    YgStatesResolver<T, EdgeInsetsGeometry> resolver,
  ) = _YgEdgeInsetsGeometryPropertyResolveWith<T>;

  const factory YgEdgeInsetsGeometryProperty.all(
    YgStatesAllResolver<EdgeInsetsGeometry> resolver,
  ) = _YgEdgeInsetsGeometryPropertyAll<T>;

  @override
  Tween<EdgeInsetsGeometry> createTween(EdgeInsetsGeometry initialValue) {
    return EdgeInsetsGeometryTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgEdgeInsetsGeometryPropertyResolveWith<T extends Enum> extends YgEdgeInsetsGeometryProperty<T>
    with YgPropertyResolveWithMixin<T, EdgeInsetsGeometry> {
  const _YgEdgeInsetsGeometryPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, EdgeInsetsGeometry> resolver;
}

class _YgEdgeInsetsGeometryPropertyAll<T extends Enum> extends YgEdgeInsetsGeometryProperty<T>
    with YgPropertyResolveAllMixin<T, EdgeInsetsGeometry> {
  const _YgEdgeInsetsGeometryPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<EdgeInsetsGeometry> resolver;
}
