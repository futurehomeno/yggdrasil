import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableEdgeInsetsGeometryProperty<T extends Enum> extends YgProperty<T, EdgeInsetsGeometry?> {
  const YgNullableEdgeInsetsGeometryProperty();

  const factory YgNullableEdgeInsetsGeometryProperty.resolveWith(
    YgStatesResolver<T, EdgeInsetsGeometry?> resolver,
  ) = _YgNullableEdgeInsetsGeometryPropertyResolveWith<T>;

  const factory YgNullableEdgeInsetsGeometryProperty.all(
    YgStatesAllResolver<EdgeInsetsGeometry?> resolver,
  ) = _YgNullableEdgeInsetsGeometryPropertyAll<T>;

  @override
  EdgeInsetsGeometryTween createTween(EdgeInsetsGeometry? initialValue) {
    return EdgeInsetsGeometryTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableEdgeInsetsGeometryPropertyResolveWith<T extends Enum> extends YgNullableEdgeInsetsGeometryProperty<T>
    with YgPropertyResolveWithMixin<T, EdgeInsetsGeometry?> {
  const _YgNullableEdgeInsetsGeometryPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, EdgeInsetsGeometry?> resolver;
}

class _YgNullableEdgeInsetsGeometryPropertyAll<T extends Enum> extends YgNullableEdgeInsetsGeometryProperty<T>
    with YgPropertyResolveAllMixin<T, EdgeInsetsGeometry?> {
  const _YgNullableEdgeInsetsGeometryPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<EdgeInsetsGeometry?> resolver;
}
