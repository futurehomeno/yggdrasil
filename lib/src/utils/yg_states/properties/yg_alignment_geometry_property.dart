import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgAlignmentGeometryProperty<T extends Enum> extends YgProperty<T, AlignmentGeometry?> {
  const YgAlignmentGeometryProperty();

  const factory YgAlignmentGeometryProperty.resolveWith(
    YgStatesResolver<T, AlignmentGeometry?> resolver,
  ) = _YgAlignmentGeometryPropertyResolveWith<T>;

  const factory YgAlignmentGeometryProperty.all(
    YgStatesAllResolver<AlignmentGeometry?> resolver,
  ) = _YgAlignmentGeometryPropertyAll<T>;

  @override
  AlignmentGeometryTween createTween(AlignmentGeometry? initialValue) {
    return AlignmentGeometryTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgAlignmentGeometryPropertyResolveWith<T extends Enum> extends YgAlignmentGeometryProperty<T>
    with YgPropertyResolveWithMixin<T, AlignmentGeometry?> {
  const _YgAlignmentGeometryPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, AlignmentGeometry?> resolver;
}

class _YgAlignmentGeometryPropertyAll<T extends Enum> extends YgAlignmentGeometryProperty<T>
    with YgPropertyResolveAllMixin<T, AlignmentGeometry?> {
  const _YgAlignmentGeometryPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<AlignmentGeometry?> resolver;
}
