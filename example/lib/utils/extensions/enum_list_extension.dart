extension EnumListExtension<T extends Enum> on List<T> {
  /// Get the enum that comes after [current].
  T next(T current) {
    final int index = indexOf(current);
    final int nextIndex = (index + 1) % length;

    return this[nextIndex];
  }
}
