import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgAlignmentProperty<T extends Enum> extends YgProperty<T, Alignment?> {
  const YgAlignmentProperty();

  const factory YgAlignmentProperty.resolveWith(
    YgStatesResolver<T, Alignment?> resolver,
  ) = _YgAlignmentPropertyResolveWith<T>;

  const factory YgAlignmentProperty.all(
    YgStatesAllResolver<Alignment?> resolver,
  ) = _YgAlignmentPropertyAll<T>;

  @override
  AlignmentTween createTween(Alignment? initialValue) {
    return AlignmentTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgAlignmentPropertyResolveWith<T extends Enum> extends YgAlignmentProperty<T>
    with YgPropertyResolveWithMixin<T, Alignment?> {
  const _YgAlignmentPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Alignment?> resolver;
}

class _YgAlignmentPropertyAll<T extends Enum> extends YgAlignmentProperty<T>
    with YgPropertyResolveAllMixin<T, Alignment?> {
  const _YgAlignmentPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Alignment?> resolver;
}
