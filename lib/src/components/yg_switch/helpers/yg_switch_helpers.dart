class YgSwitchHelpers {
  const YgSwitchHelpers._();

  static bool? getNextValue(
    bool? value,
    bool triState,
  ) {
    if (!triState) {
      return value != true;
    }

    if (value == null) {
      return true;
    }

    if (value == true) {
      return false;
    }

    return null;
  }
}
