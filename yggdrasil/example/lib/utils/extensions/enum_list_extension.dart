extension EnumListExtension<T extends Enum> on List<T> {
  /// Gets the next enum after [current] from a list of enums.
  ///
  /// Intended to be used for quickly iterating over Enum.values. [current] has
  /// to be in the list of enums. Wraps around to the first enum if [current] is
  /// the last enum in the list.
  T next(T current) {
    final int index = indexOf(current);
    final int nextIndex = (index + 1) % length;

    return this[nextIndex];
  }
}
