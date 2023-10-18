import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgNullableAlignmentProperty<T extends Enum> extends YgProperty<T, Alignment?> {
  const YgNullableAlignmentProperty();

  const factory YgNullableAlignmentProperty.resolveWith(
    YgStatesResolver<T, Alignment?> resolver,
  ) = _YgNullableAlignmentPropertyResolveWith<T>;

  const factory YgNullableAlignmentProperty.all(
    YgStatesAllResolver<Alignment?> resolver,
  ) = _YgNullableAlignmentPropertyAll<T>;

  @override
  AlignmentTween createTween(Alignment? initialValue) {
    return AlignmentTween(
      begin: initialValue,
      end: initialValue,
    );
  }
}

class _YgNullableAlignmentPropertyResolveWith<T extends Enum> extends YgNullableAlignmentProperty<T>
    with YgPropertyResolveWithMixin<T, Alignment?> {
  const _YgNullableAlignmentPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, Alignment?> resolver;
}

class _YgNullableAlignmentPropertyAll<T extends Enum> extends YgNullableAlignmentProperty<T>
    with YgPropertyResolveAllMixin<T, Alignment?> {
  const _YgNullableAlignmentPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<Alignment?> resolver;
}
