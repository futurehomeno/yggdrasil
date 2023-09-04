part of 'yg_dropdown_field.dart';

/// We sometimes need to be able to accept a dropdown controller without knowing
/// the value type
// ignore: avoid-dynamic
typedef YgDynamicDropdownController<T extends Object> = YgDropdownController<T, dynamic>;

/// The base class controller for a [YgDropdownField].
///
/// Should not be used directly, instead look at one of the following more
/// specific implementations.
///
///  - [YgSingleSelectDropdownController].
///  - [YgMultiSelectDropdownController].
abstract class YgDropdownController<T extends Object, V> extends ValueNotifier<V> {
  YgDropdownController({
    required V initialValue,
  }) : super(initialValue);

  /// Builds a title using the passed entries and the current [value].
  ///
  /// Used internally in the [YgDropdownField] and should generally not be used
  /// by a user of the [YgDropdownField].
  String buildTitle(List<YgDropdownEntry<T>> entries);

  /// Handles a tap on a entry.
  void onEntryTapped(YgDropdownEntry<T> entry);

  /// Returns true when an entry is currently selected.
  bool isEntrySelected(YgDropdownEntry<T> entry);

  /// Whether the controller contains a value.
  bool get filled;

  YgDropdownFieldState<T, YgDropdownField<T>>? _field;

  /// Method to attach a controller to a [YgDropdownField].
  ///
  /// !--- Warning ---
  /// Used internally in the [YgDropdownField] and should not be used by a user
  /// of the [YgDropdownField].
  ///
  /// Should not be called when the controller is already attached to a
  /// [YgDropdownField].
  void attach(YgDropdownFieldState<T, YgDropdownField<T>> field) {
    assert(
      _field == null || _field == field,
      'Can not attach controller to multiple dropdowns.',
    );
    if (_field != null && _field != field) {
      return;
    }
    _field = field;
  }

  /// Method to detach a controller from its current [YgDropdownField].
  ///
  /// Used internally in the [YgDropdownField] and should not be used by a user
  /// of the [YgDropdownField].
  void detach() {
    _field = null;
  }

  /// Opens the menu specifically.
  ///
  /// Should be called only when the menu specifically should be opened. For most
  /// cases you want to use the [open] method instead to show either a menu or
  /// bottom sheet, depending on the platform the user is on.
  void openMenu() {
    final YgDropdownFieldState<T, YgDropdownField<T>>? field = _field;
    assert(
      field != null,
      'YgDropdownController.openMenu was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    field.openMenu();
  }

  /// Opens the bottom sheet specifically.
  ///
  /// Should be called only when the menu specifically should be opened. For most
  /// cases you want to use the [open] method instead to show either a menu or
  /// bottom sheet, depending on the platform the user is on.
  void openBottomSheet() {
    final YgDropdownFieldState<T, YgDropdownField<T>>? field = _field;
    assert(
      field != null,
      'YgDropdownController.openBottomSheet was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    field.openBottomSheet();
  }

  /// Opens the dropdown.
  ///
  /// Shows either a menu or bottom sheet, depending on the platform the user is
  /// on.
  void open() {
    final YgDropdownFieldState<T, YgDropdownField<T>>? field = _field;
    assert(
      field != null,
      'YgDropdownController.open was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    field.open();
  }

  /// Closes the dropdown.
  void close() {
    final YgDropdownFieldState<T, YgDropdownField<T>>? field = _field;
    assert(
      field != null,
      'YgDropdownController.close was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    field.close();
  }

  /// Whether the dropdown in open or closed.
  bool get isOpen {
    final YgDropdownFieldState<T, YgDropdownField<T>>? field = _field;
    assert(
      field != null,
      'YgDropdownController.opened was accessed while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return false;
    }

    return field.isOpen;
  }
}
