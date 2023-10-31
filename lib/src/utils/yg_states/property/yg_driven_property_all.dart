part of 'yg_property.dart';

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
