part of yg_states;


/// Implementation of [YgProperty.resolveWith].
///
/// Resolves value using [resolver]. Does not resolve on state change as this
/// property does not rely on the current state.
class _YgPropertyResolveAll<T extends YgState, V> extends YgProperty<T, V> with YgPropertyResolveAllMixin<T, V> {
  const _YgPropertyResolveAll(this.resolver);

  @override
  final YgStatesAllResolver<V> resolver;
}
