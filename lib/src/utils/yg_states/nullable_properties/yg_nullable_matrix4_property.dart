import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableMatrix4Property<T extends Enum> extends YgProperty<T, Matrix4?> {
  const YgNullableMatrix4Property();

  const factory YgNullableMatrix4Property.resolveWith(
    YgStatesResolver<T, Matrix4?> resolver,
  ) = _YgNullableMatrix4PropertyResolveWith<T>;

  const factory YgNullableMatrix4Property.all(
    YgStatesAllResolver<Matrix4?> resolver,
  ) = _YgNullableMatrix4PropertyAll<T>;

  @override
  Matrix4Tween createTween(Matrix4? initialValue) {
    return Matrix4Tween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableMatrix4PropertyResolveWith<T extends Enum> extends YgNullableMatrix4Property<T>
    with YgPropertyResolveWithMixin<T, Matrix4?> {
  const _YgNullableMatrix4PropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Matrix4?> resolver;
}

class _YgNullableMatrix4PropertyAll<T extends Enum> extends YgNullableMatrix4Property<T>
    with YgPropertyResolveAllMixin<T, Matrix4?> {
  const _YgNullableMatrix4PropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Matrix4?> resolver;
}
