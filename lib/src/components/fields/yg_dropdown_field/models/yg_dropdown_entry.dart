import 'package:yggdrasil/yggdrasil.dart';

/// A entry for a [YgDropdownField].
class YgDropdownEntry<T extends Object> {
  const YgDropdownEntry({
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
  });

  /// The title of the entry.
  ///
  /// This will be shown in the dropdown or menu, and as the value in the field
  /// when the user selects this entry.
  final String title;

  /// The value which is used to determine which entry is selected.
  ///
  /// This value is what you will get back from the [YgDropdownField.onChange]
  /// when this entry is selected.
  final T value;

  /// The subtitle of the entry.
  ///
  /// !--- WARNING ---
  /// The subtitle is only shown when the bottom sheet or menu are opened, and
  /// NOT in the field it self, therefor they should NOT be used as the main
  /// identifier of the entry as the user will not be able to identify the
  /// selected value from looking at the field it self!
  final String? subtitle;

  /// The icon of the entry.
  ///
  /// !--- WARNING ---
  /// The icon is only shown when the bottom sheet or menu are opened, and
  /// NOT in the field it self, therefor they should NOT be used as the main
  /// identifier of the entry as the user will not be able to identify the
  /// selected value from looking at the field it self!
  final YgIcon? icon;
}
