enum YgSearchAction {
  /// Show a menu when the dropdown is pressed.
  menu,

  /// Show a full screen search page when the dropdown is pressed.
  screen,

  /// Show either a menu or dropdown depending on the current platform.
  auto,

  /// Do nothing, use the dropdown as a button.
  ///
  /// !-- WARNING --
  /// This may be required if you want to manually do something before actually
  /// opening the dropdown using the [YgDropdownController], but using the
  /// [YgDropdownField] as an actual button to open a custom bottom sheet for
  /// example is not recommended as the field will not be able to track whether
  /// the dropdown is open or not and thus will not be able to update its
  /// styling accordingly.
  none,
}
