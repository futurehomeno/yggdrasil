part of 'yg_property.dart';

/// Mixin which slightly simplifies implementing a custom property with a
/// all static method.
mixin YgPropertyResolveAllMixin<T extends Enum, V> on YgProperty<T, V> {
  YgStatesAllResolver<V> get resolver;

  @override
  V resolve(BuildContext context, Set<T> states) {
    return resolver(context);
  }
}

class _YgPropertyResolveAll<T extends Enum, V> extends YgProperty<T, V> with YgPropertyResolveAllMixin<T, V> {
  const _YgPropertyResolveAll(this.resolver);

  @override
  final YgStatesAllResolver<V> resolver;
}
