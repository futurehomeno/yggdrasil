extension ListSafeAtExtension<E> on List<E> {
  T? safeAt<T>(int index) {
    if (length > index) {
      final value = this[index];
      if (value is T) {
        return value;
      }
    }

    return null;
  }
}
