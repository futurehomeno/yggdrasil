part of 'yg_dropdown_field.dart';

/// Any dropdown controller.
typedef YgAnyDropdownController<T extends Object>
    = YgDropdownController<T, Object?, YgDropdownFieldWidgetState<T, YgDropdownField<T>>>;

/// The base class controller for a [YgDropdownField].
///
/// Should not be used directly, instead look at using one of the following specific
/// implementations.
///
///  - [YgSingleSelectDropdownController].
///  - [YgMultiSelectDropdownController].
sealed class YgDropdownController<T extends Object, V, S extends YgDropdownFieldWidgetState<T, YgDropdownField<T>>>
    extends ChangeNotifier {
  YgDropdownController({
    required V initialValue,
  }) : _value = initialValue;

  V _value;

  /// The currently selected value.
  V get value;
  set value(V newValue);

  /// The currently pending value.
  ///
  /// !--- WARNING ---
  /// Used internally in the [YgDropdownField] and should generally not be used
  /// by a user of the [YgDropdownField].
  ///
  /// This value is the value shown on screen when the user has opened the
  /// dropdown, this is not the current value of the dropdown and this value may
  /// be discarded by the user by triggering [discardChanges]. This may for
  /// example happen when the dropdown bottom sheet is closed without saving.
  ValueNotifier<V> get pendingValue;

  /// Builds a title using the passed entries and the current [value].
  ///
  /// !--- WARNING ---
  /// Used internally in the [YgDropdownField] and should generally not be used
  /// by a user of the [YgDropdownField].
  String buildTitle(List<YgDropdownEntry<T>> entries);

  /// Handles a tap on a entry.
  ///
  /// !--- WARNING ---
  /// Used internally in the [YgDropdownField] and should generally not be used
  /// by a user of the [YgDropdownField].
  ///
  /// This will update the pending value according to the configuration of the
  /// dropdown.
  ///
  /// When [submit] is set to true the value will directly be submitted after
  /// the pendingValue has been updated.
  ///
  /// When both [submit] and [close] are set to true the dropdown will be closed
  /// after the value has been submitted.
  void onValueTapped(T value, {bool submit = false, bool close = false});

  /// Returns true when a value is currently selected.
  ///
  /// !--- WARNING ---
  /// Used internally in the [YgDropdownField] and should generally not be used
  /// by a user of the [YgDropdownField].
  ///
  /// Whether the value is selected as the [pendingValue].
  bool isValuePendingSelected(T value);

  /// Submits pending changes.
  ///
  /// !--- WARNING ---
  /// Used internally in the [YgDropdownField] and should generally not be used
  /// by a user of the [YgDropdownField].
  ///
  /// Closes the dropdown if [close] is set to true.
  void submitChanges({bool close = false});

  /// Discards pending changes.
  ///
  /// !--- WARNING ---
  /// Used internally in the [YgDropdownField] and should generally not be used
  /// by a user of the [YgDropdownField].
  ///
  /// Closes the dropdown if [close] is set to true.
  void discardChanges({bool close = false});

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

  /// Whether the dropdown in open or closed.
  bool get isOpen {
    final S? field = _fieldState;
    if (field == null) {
      return false;
    }

    return field.isOpen;
  }
}
