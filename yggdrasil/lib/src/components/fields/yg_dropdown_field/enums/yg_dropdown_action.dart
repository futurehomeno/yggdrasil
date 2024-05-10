import 'package:yggdrasil/src/components/fields/yg_dropdown_field/yg_dropdown_field.dart';

/// The action that should be performed when the [YgDropdownField] is pressed.
enum YgDropdownAction {
  /// Show a menu when the dropdown is pressed.
  menu,

  /// Show a bottom sheet when the dropdown is pressed.
  bottomSheet,

  /// Show a picker bottom sheet when the dropdown is pressed.
  ///
  /// !-- WARNING --
  /// This only works for single select dropdowns, using this option in a multi
  /// select will throw in dev mode and be treated as auto in release mode.
  picker,

  /// Show either a menu or picker bottom sheet depending on the current
  /// platform.
  ///
  /// !-- WARNING --
  /// This only works for single select dropdowns, using this option in a multi
  /// select will throw in dev mode and be treated as auto in release mode.
  autoPicker,

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
