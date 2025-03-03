part of yg_states;


/// Mixin which slightly simplifies implementing a custom property with an
/// all static method.
mixin YgPropertyResolveAllMixin<T extends YgState, V> on YgProperty<T, V> {
  YgStatesAllResolver<V> get resolver;

  @override
  V resolve(BuildContext context, T states) {
    return resolver(context);
  }
}
