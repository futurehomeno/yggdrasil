part of 'yg_property.dart';

class _YgDrivenPropertyAll<V> implements YgDrivenProperty<V> {
  const _YgDrivenPropertyAll({
    required this.value,
  });

  @override
  final V value;

  @override
  void addListener(VoidCallback listener) {
    // Value will never change.
  }

  @override
  void removeListener(VoidCallback listener) {
    // Value will never change.
  }

  @override
  YgDrivenProperty<T> map<T>(ValueMapper<V, T> mapper) {
    return _YgDrivenPropertyAll<T>(
      value: mapper(value),
    );
  }
}
