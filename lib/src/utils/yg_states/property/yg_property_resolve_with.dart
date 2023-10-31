part of 'yg_property.dart';

class _YgPropertyResolveWith<T extends Enum, V> extends YgProperty<T, V> with YgPropertyResolveWithMixin<T, V> {
  const _YgPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, V> resolver;
}
