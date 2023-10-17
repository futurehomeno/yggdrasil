import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgBorderRadiusProperty<T extends Enum> extends YgProperty<T, BorderRadius?> {
  const YgBorderRadiusProperty();

  const factory YgBorderRadiusProperty.resolveWith(
    YgStatesResolver<T, BorderRadius?> resolver,
  ) = _YgBorderRadiusPropertyResolveWith<T>;

  const factory YgBorderRadiusProperty.all(
    YgStatesAllResolver<BorderRadius?> resolver,
  ) = _YgBorderRadiusPropertyAll<T>;

  @override
  BorderRadiusTween createTween(BorderRadius? initialValue) {
    return BorderRadiusTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgBorderRadiusPropertyResolveWith<T extends Enum> extends YgBorderRadiusProperty<T>
    with YgPropertyResolveWithMixin<T, BorderRadius?> {
  const _YgBorderRadiusPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, BorderRadius?> resolver;
}

class _YgBorderRadiusPropertyAll<T extends Enum> extends YgBorderRadiusProperty<T>
    with YgPropertyResolveAllMixin<T, BorderRadius?> {
  const _YgBorderRadiusPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<BorderRadius?> resolver;
}
