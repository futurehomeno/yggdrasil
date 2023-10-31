part of 'yg_property.dart';

/// Mixin which slightly simplifies implementing a custom property with a
/// resolveWith static method.
mixin YgPropertyResolveWithMixin<T extends Enum, V> on YgProperty<T, V> {
  YgStatesResolver<T, V> get resolver;

  @override
  V resolve(BuildContext context, Set<T> states) {
    return resolver(context, states);
  }
}

class _YgPropertyResolveWith<T extends Enum, V> extends YgProperty<T, V> with YgPropertyResolveWithMixin<T, V> {
  const _YgPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, V> resolver;
}
