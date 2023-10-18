import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgFractionalOffsetProperty<T extends Enum> extends YgProperty<T, FractionalOffset> {
  const YgFractionalOffsetProperty();

  const factory YgFractionalOffsetProperty.resolveWith(
    YgStatesResolver<T, FractionalOffset> resolver,
  ) = _YgFractionalOffsetPropertyResolveWith<T>;

  const factory YgFractionalOffsetProperty.all(
    YgStatesAllResolver<FractionalOffset> resolver,
  ) = _YgFractionalOffsetPropertyAll<T>;

  @override
  Tween<FractionalOffset> createTween(FractionalOffset initialValue) {
    return FractionalOffsetTween(
      begin: initialValue,
      end: initialValue,
    ) as Tween<FractionalOffset>;
  }
}

class _YgFractionalOffsetPropertyResolveWith<T extends Enum> extends YgFractionalOffsetProperty<T>
    with YgPropertyResolveWithMixin<T, FractionalOffset> {
  const _YgFractionalOffsetPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, FractionalOffset> resolver;
}

class _YgFractionalOffsetPropertyAll<T extends Enum> extends YgFractionalOffsetProperty<T>
    with YgPropertyResolveAllMixin<T, FractionalOffset> {
  const _YgFractionalOffsetPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<FractionalOffset> resolver;
}
