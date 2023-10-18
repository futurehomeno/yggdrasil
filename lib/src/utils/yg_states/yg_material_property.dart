import 'package:flutter/material.dart';

import '_yg_states.dart';

abstract class YgMaterialProperty<T> extends YgProperty<MaterialState, T> {
  const YgMaterialProperty();

  const factory YgMaterialProperty.resolveWith(
    YgStatesResolver<MaterialState, T> resolver,
  ) = _YgMaterialPropertyResolveWith<T>;

  const factory YgMaterialProperty.all(
    YgStatesAllResolver<Material> resolver,
  ) = _YgMaterialPropertyAll<T>;
}

class _YgMaterialPropertyResolveWith<T> extends YgMaterialProperty<MaterialState>
    with YgPropertyResolveWithMixin<MaterialState, T> {
  const _YgMaterialPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<MaterialState, T> resolver;
}

class _YgMaterialPropertyAll<T> extends YgMaterialProperty<T> with YgPropertyResolveAllMixin<MaterialState, T> {
  const _YgMaterialPropertyAll(this.resolver);

  @override
  final YgStatesAllResolver<T> resolver;
}
