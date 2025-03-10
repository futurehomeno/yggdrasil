part of yg_states;


/// Implementation of [YgProperty.resolveWith].
///
/// Resolves value using [resolver].
class _YgPropertyResolveWith<T extends YgState, V> extends YgProperty<T, V> with YgPropertyResolveWithMixin<T, V> {
  const _YgPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, V> resolver;
}
