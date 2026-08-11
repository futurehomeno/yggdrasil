// ignore_for_file: avoid-dynamic

extension DynamicSafeAsExtension on dynamic {
  T? safeAs<T>() {
    final dynamic value = this;

    if (value is T) {
      return value;
    }

    return null;
  }
}
