part of 'yg_dropdown_field.dart';

/// We sometimes need to be able to accept a dropdown controller without knowing
/// the value type
// ignore: avoid-dynamic
typedef YgDynamicDropdownController<T extends Object> = YgDropdownController<T, dynamic>;

abstract class YgDropdownController<T extends Object, V> extends ValueNotifier<V> {
  YgDropdownController({
    required V initialValue,
  }) : super(initialValue);

  /// Builds a title using the passed entries and the current [value].
  String buildTitle(List<YgDropdownEntry<T>> entries);

  /// Handles a tap on a entry.
  void onEntryTapped(YgDropdownEntry<T> entry);

  /// Returns true when an entry is currently selected.
  bool isEntrySelected(YgDropdownEntry<T> entry);

  /// Whether the controller contains a value.
  bool get filled;

  YgDropdownFieldState<T, YgDropdownField<T>>? _field;

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

  void detach() {
    _field = null;
  }

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
