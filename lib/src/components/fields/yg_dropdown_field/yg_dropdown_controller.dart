// ignore_for_file: avoid-dynamic

part of 'yg_dropdown_field.dart';

/// We sometimes need to be able to accept a dropdown controller without knowing
/// the value type
typedef YgDynamicDropdownController<T extends Object>
    = YgDropdownController<T, dynamic, YgDropdownFieldState<T, YgDropdownField<T>>>;

/// The base class controller for a [YgDropdownField].
///
/// Should not be used directly, instead look at using one of the following specific
/// implementations.
///
///  - [YgSingleSelectDropdownController].
///  - [YgMultiSelectDropdownController].
abstract class YgDropdownController<T extends Object, V, S extends YgDropdownFieldState<T, YgDropdownField<T>>>
    extends ValueNotifier<V> {
  YgDropdownController({
    required V initialValue,
  }) : super(initialValue);

  /// Builds a title using the passed entries and the current [value].
  ///
  /// Used internally in the [YgDropdownField] and should generally not be used
  /// by a user of the [YgDropdownField].
  String buildTitle(List<YgDropdownEntry<T>> entries);

  /// Handles a tap on a entry.
  void onValueTapped(T value);

  /// Returns true when a value is currently selected.
  bool isValueSelected(T value);

  /// Whether the controller contains a value.
  bool get filled;

  S? _fieldState;

  /// Method to attach a controller to a [YgDropdownField].
  ///
  /// !--- Warning ---
  /// Should not be called when the controller is already attached to a
  /// [YgDropdownField].
  void _attach(S fieldState) {
    assert(
      _fieldState == null || _fieldState == fieldState,
      'Can not attach controller to multiple dropdowns.',
    );
    if (_fieldState != null && _fieldState != fieldState) {
      return;
    }
    _fieldState = fieldState;
  }

  /// Method to detach a controller from its current [YgDropdownField].
  void _detach() {
    _fieldState = null;
  }

  /// Opens the menu specifically.
  ///
  /// Should be called only when the menu specifically should be opened. For most
  /// cases you want to use the [open] method instead to show either a menu or
  /// bottom sheet, depending on the platform the user is on.
  void openMenu() {
    final S? field = _fieldState;
    assert(
      field != null,
      'YgDropdownController.openMenu was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    field.openMenu();
  }

  // ignore: unused-code
  /// Opens the bottom sheet specifically.
  ///
  /// Should be called only when the bottom sheet specifically should be opened.
  /// For most cases you want to use the [open] method instead to show either a
  /// menu or bottom sheet, depending on the platform the user is on.
  void openBottomSheet() {
    final S? field = _fieldState;
    assert(
      field != null,
      'YgDropdownController.openBottomSheet was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    field.openBottomSheet();
  }

  // ignore: unused-code
  /// Opens the dropdown.
  ///
  /// Shows either a menu or bottom sheet, depending on the platform the user is
  /// on.
  void open() {
    final S? field = _fieldState;
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
    final S? field = _fieldState;
    assert(
      field != null,
      'YgDropdownController.close was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    field.close();
  }

  // ignore: unused-code
  /// Whether the dropdown in open or closed.
  bool get isOpen {
    final S? field = _fieldState;
    assert(
      field != null,
      'YgDropdownController.isOpen was accessed while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return false;
    }

    return field.isOpen;
  }
}
