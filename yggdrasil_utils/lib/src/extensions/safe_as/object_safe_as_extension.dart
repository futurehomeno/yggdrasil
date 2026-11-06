extension ObjectSafeAsExtension<T extends Object> on T {
  V? safeAs<V extends T>() {
    final T value = this;

    if (value is V) {
      return value;
    }

    return null;
  }
}
