import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

extension YgNullableDrivenPropertyExtension<V> on YgDrivenProperty<V>? {
  YgDrivenProperty<V> orDefault(V defaultValue) {
    return _YgDrivenPropertyAll<V>(value: defaultValue);
  }
}

class _YgDrivenPropertyAll<V> implements YgDrivenProperty<V> {
  const _YgDrivenPropertyAll({
    required this.value,
  });

  @override
  final V value;

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}

  @override
  YgDrivenProperty<T> map<T>(ValueMapper<V, T> mapper) {
    return _YgDrivenPropertyAll<T>(
      value: mapper(value),
    );
  }
}
