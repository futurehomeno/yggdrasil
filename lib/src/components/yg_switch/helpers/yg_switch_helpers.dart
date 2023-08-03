class YgSwitchHelpers {
  YgSwitchHelpers._();

  static bool? getNextValue(
    bool? value,
    bool triState,
  ) {
    final bool? currentValue = value;
    bool? nextValue;

    if (triState) {
      if (currentValue == null) {
        nextValue = true;
      } else if (currentValue == true) {
        nextValue = false;
      } else {
        nextValue = null;
      }
    } else {
      nextValue = !currentValue!;
    }

    return nextValue;
  }
}
