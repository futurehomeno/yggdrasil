import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableBoxConstraintsProperty<T extends Enum> extends YgProperty<T, BoxConstraints?> {
  const YgNullableBoxConstraintsProperty();

  const factory YgNullableBoxConstraintsProperty.resolveWith(
    YgStatesResolver<T, BoxConstraints?> resolver,
  ) = _YgNullableBoxConstraintsPropertyResolveWith<T>;

  const factory YgNullableBoxConstraintsProperty.all(
    YgStatesAllResolver<BoxConstraints?> resolver,
  ) = _YgNullableBoxConstraintsPropertyAll<T>;

  @override
  BoxConstraintsTween createTween(BoxConstraints? initialValue) {
    return BoxConstraintsTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableBoxConstraintsPropertyResolveWith<T extends Enum> extends YgNullableBoxConstraintsProperty<T>
    with YgPropertyResolveWithMixin<T, BoxConstraints?> {
  const _YgNullableBoxConstraintsPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, BoxConstraints?> resolver;
}

class _YgNullableBoxConstraintsPropertyAll<T extends Enum> extends YgNullableBoxConstraintsProperty<T>
    with YgPropertyResolveAllMixin<T, BoxConstraints?> {
  const _YgNullableBoxConstraintsPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<BoxConstraints?> resolver;
}
