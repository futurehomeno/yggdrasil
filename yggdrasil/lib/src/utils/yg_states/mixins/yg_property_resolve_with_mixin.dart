part of yg_states;


/// Mixin which slightly simplifies implementing a custom property with a
/// resolveWith static method.
mixin YgPropertyResolveWithMixin<T extends YgState, V> on YgProperty<T, V> {
  YgStatesResolver<T, V> get resolver;

  @override
  V resolve(BuildContext context, T states) {
    return resolver(context, states);
  }
}
