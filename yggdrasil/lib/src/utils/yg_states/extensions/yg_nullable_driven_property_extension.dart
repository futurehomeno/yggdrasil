part of yg_states;


extension YgNullableDrivenPropertyExtension<V> on YgDrivenProperty<V>? {
  /// Assign a default value if a property is null.
  YgDrivenProperty<V> orDefault(V defaultValue) {
    final YgDrivenProperty<V>? prop = this;

    if (prop != null) {
      return prop;
    }

    return YgDrivenProperty<V>.all(
      value: defaultValue,
    );
  }
}
