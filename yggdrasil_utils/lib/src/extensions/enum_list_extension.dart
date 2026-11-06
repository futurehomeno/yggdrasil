extension EnumListExtension<T extends Enum> on List<T> {
  T? safeByName(String? name) {
    if (name == null) {
      return null;
    }

    for (final T $enum in this) {
      if ($enum.name == name) {
        return $enum;
      }
    }

    return null;
  }
}
