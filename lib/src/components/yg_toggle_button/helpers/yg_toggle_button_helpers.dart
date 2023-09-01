class YgToggleButtonHelpers {
  const YgToggleButtonHelpers._();

  static bool? getNextValue(
    bool? value,
  ) {
    if (value == null) {
      return true;
    }

    if (value == true) {
      return false;
    }

    return null;
  }
}
