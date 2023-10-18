import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgBoxConstraintsProperty<T extends Enum> extends YgProperty<T, BoxConstraints> {
  const YgBoxConstraintsProperty();

  const factory YgBoxConstraintsProperty.resolveWith(
    YgStatesResolver<T, BoxConstraints> resolver,
  ) = _YgBoxConstraintsPropertyResolveWith<T>;

  const factory YgBoxConstraintsProperty.all(
    YgStatesAllResolver<BoxConstraints> resolver,
  ) = _YgBoxConstraintsPropertyAll<T>;

  @override
  Tween<BoxConstraints> createTween(BoxConstraints initialValue) {
    return BoxConstraintsTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgBoxConstraintsPropertyResolveWith<T extends Enum> extends YgBoxConstraintsProperty<T>
    with YgPropertyResolveWithMixin<T, BoxConstraints> {
  const _YgBoxConstraintsPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, BoxConstraints> resolver;
}

class _YgBoxConstraintsPropertyAll<T extends Enum> extends YgBoxConstraintsProperty<T>
    with YgPropertyResolveAllMixin<T, BoxConstraints> {
  const _YgBoxConstraintsPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<BoxConstraints> resolver;
}
