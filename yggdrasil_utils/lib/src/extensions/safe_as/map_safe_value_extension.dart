extension MapSafeValueExtension<K, V> on Map<K, V> {
  T? safeValue<T>(K name) {
    final value = this[name];

    if (value is T) {
      return value;
    }

    return null;
  }
}
