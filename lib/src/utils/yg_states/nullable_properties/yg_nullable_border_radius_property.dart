import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableBorderRadiusProperty<T extends Enum> extends YgProperty<T, BorderRadius?> {
  const YgNullableBorderRadiusProperty();

  const factory YgNullableBorderRadiusProperty.resolveWith(
    YgStatesResolver<T, BorderRadius?> resolver,
  ) = _YgNullableBorderRadiusPropertyResolveWith<T>;

  const factory YgNullableBorderRadiusProperty.all(
    YgStatesAllResolver<BorderRadius?> resolver,
  ) = _YgNullableBorderRadiusPropertyAll<T>;

  @override
  BorderRadiusTween createTween(BorderRadius? initialValue) {
    return BorderRadiusTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableBorderRadiusPropertyResolveWith<T extends Enum> extends YgNullableBorderRadiusProperty<T>
    with YgPropertyResolveWithMixin<T, BorderRadius?> {
  const _YgNullableBorderRadiusPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, BorderRadius?> resolver;
}

class _YgNullableBorderRadiusPropertyAll<T extends Enum> extends YgNullableBorderRadiusProperty<T>
    with YgPropertyResolveAllMixin<T, BorderRadius?> {
  const _YgNullableBorderRadiusPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<BorderRadius?> resolver;
}
