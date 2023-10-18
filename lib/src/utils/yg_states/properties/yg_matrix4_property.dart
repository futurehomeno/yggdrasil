import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgMatrix4Property<T extends Enum> extends YgProperty<T, Matrix4> {
  const YgMatrix4Property();

  const factory YgMatrix4Property.resolveWith(
    YgStatesResolver<T, Matrix4> resolver,
  ) = _YgMatrix4PropertyResolveWith<T>;

  const factory YgMatrix4Property.all(
    YgStatesAllResolver<Matrix4> resolver,
  ) = _YgMatrix4PropertyAll<T>;

  @override
  Tween<Matrix4> createTween(Matrix4 initialValue) {
    return Matrix4Tween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgMatrix4PropertyResolveWith<T extends Enum> extends YgMatrix4Property<T>
    with YgPropertyResolveWithMixin<T, Matrix4> {
  const _YgMatrix4PropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Matrix4> resolver;
}

class _YgMatrix4PropertyAll<T extends Enum> extends YgMatrix4Property<T> with YgPropertyResolveAllMixin<T, Matrix4> {
  const _YgMatrix4PropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Matrix4> resolver;
}
