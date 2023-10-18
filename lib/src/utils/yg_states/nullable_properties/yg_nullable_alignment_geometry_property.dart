import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableAlignmentGeometryProperty<T extends Enum> extends YgProperty<T, AlignmentGeometry?> {
  const YgNullableAlignmentGeometryProperty();

  const factory YgNullableAlignmentGeometryProperty.resolveWith(
    YgStatesResolver<T, AlignmentGeometry?> resolver,
  ) = _YgNullableAlignmentGeometryPropertyResolveWith<T>;

  const factory YgNullableAlignmentGeometryProperty.all(
    YgStatesAllResolver<AlignmentGeometry?> resolver,
  ) = _YgNullableAlignmentGeometryPropertyAll<T>;

  @override
  AlignmentGeometryTween createTween(AlignmentGeometry? initialValue) {
    return AlignmentGeometryTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableAlignmentGeometryPropertyResolveWith<T extends Enum> extends YgNullableAlignmentGeometryProperty<T>
    with YgPropertyResolveWithMixin<T, AlignmentGeometry?> {
  const _YgNullableAlignmentGeometryPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, AlignmentGeometry?> resolver;
}

class _YgNullableAlignmentGeometryPropertyAll<T extends Enum> extends YgNullableAlignmentGeometryProperty<T>
    with YgPropertyResolveAllMixin<T, AlignmentGeometry?> {
  const _YgNullableAlignmentGeometryPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<AlignmentGeometry?> resolver;
}
