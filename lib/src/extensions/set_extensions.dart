extension SetExtensions<T> on Set<T> {
  bool any(bool Function(T element) test) {
    for (T element in this) {
      if (test(element)) return true;
    }
    return false;
  }
}
