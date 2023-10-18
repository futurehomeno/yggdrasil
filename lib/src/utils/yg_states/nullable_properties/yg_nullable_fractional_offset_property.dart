import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableFractionalOffsetProperty<T extends Enum> extends YgProperty<T, FractionalOffset?> {
  const YgNullableFractionalOffsetProperty();

  const factory YgNullableFractionalOffsetProperty.resolveWith(
    YgStatesResolver<T, FractionalOffset?> resolver,
  ) = _YgNullableFractionalOffsetPropertyResolveWith<T>;

  const factory YgNullableFractionalOffsetProperty.all(
    YgStatesAllResolver<FractionalOffset?> resolver,
  ) = _YgNullableFractionalOffsetPropertyAll<T>;

  @override
  FractionalOffsetTween createTween(FractionalOffset? initialValue) {
    return FractionalOffsetTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableFractionalOffsetPropertyResolveWith<T extends Enum> extends YgNullableFractionalOffsetProperty<T>
    with YgPropertyResolveWithMixin<T, FractionalOffset?> {
  const _YgNullableFractionalOffsetPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, FractionalOffset?> resolver;
}

class _YgNullableFractionalOffsetPropertyAll<T extends Enum> extends YgNullableFractionalOffsetProperty<T>
    with YgPropertyResolveAllMixin<T, FractionalOffset?> {
  const _YgNullableFractionalOffsetPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<FractionalOffset?> resolver;
}
