import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableRelativeRectProperty<T extends Enum> extends YgProperty<T, RelativeRect?> {
  const YgNullableRelativeRectProperty();

  const factory YgNullableRelativeRectProperty.resolveWith(
    YgStatesResolver<T, RelativeRect?> resolver,
  ) = _YgNullableRelativeRectPropertyResolveWith<T>;

  const factory YgNullableRelativeRectProperty.all(
    YgStatesAllResolver<RelativeRect?> resolver,
  ) = _YgNullableRelativeRectPropertyAll<T>;

  @override
  RelativeRectTween createTween(RelativeRect? initialValue) {
    return RelativeRectTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableRelativeRectPropertyResolveWith<T extends Enum> extends YgNullableRelativeRectProperty<T>
    with YgPropertyResolveWithMixin<T, RelativeRect?> {
  const _YgNullableRelativeRectPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, RelativeRect?> resolver;
}

class _YgNullableRelativeRectPropertyAll<T extends Enum> extends YgNullableRelativeRectProperty<T>
    with YgPropertyResolveAllMixin<T, RelativeRect?> {
  const _YgNullableRelativeRectPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<RelativeRect?> resolver;
}
