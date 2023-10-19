import 'package:flutter/widgets.dart';

import '_yg_states.dart';

abstract class YgDrivenPropertyWithParent<T, V> implements YgDrivenProperty<V> {
  const YgDrivenPropertyWithParent(this.parent);

  const factory YgDrivenPropertyWithParent.fromMapper(
    YgDrivenProperty<T> parent,
    V Function(T) mapper,
  ) = _YgDrivenPropertyWithParentFromMapper<T, V>;

  final YgDrivenProperty<T> parent;

  @override
  void addListener(VoidCallback listener) {
    parent.addListener(listener);
  }

  @override
  void dispose() {
    parent.dispose();
  }

  @override
  void removeListener(VoidCallback listener) {
    parent.removeListener(listener);
  }

  @override
  V get value => mapValue(parent.value);

  V mapValue(T value);

  @override
  bool operator ==(Object? other) => other is YgDrivenPropertyWithParent<T, V> && other.parent == parent;

  @override
  int get hashCode => parent.hashCode;
}

class _YgDrivenPropertyWithParentFromMapper<T, V> extends YgDrivenPropertyWithParent<T, V> {
  const _YgDrivenPropertyWithParentFromMapper(
    super.parent,
    this._mapper,
  );

  final V Function(T value) _mapper;

  @override
  V mapValue(T value) => _mapper(parent.value);
}
