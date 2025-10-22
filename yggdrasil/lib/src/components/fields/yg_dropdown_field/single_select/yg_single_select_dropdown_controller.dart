part of '../yg_dropdown_field.dart';

/// The controller for a [YgDropdownField].
class YgSingleSelectDropdownController<T extends Object>
    extends YgDropdownController<T, T?, _YgDropdownFieldSingleSelectState<T>> {
  YgSingleSelectDropdownController({
    super.initialValue,
  }) : pendingValue = ValueNotifier<T?>(
         initialValue,
       );

  @override
  final ValueNotifier<T?> pendingValue;

  @override
  T? get value => _value;

  @override
  set value(T? newValue) {
    if (_value == newValue) {
      return;
    }

    _value = newValue;
    notifyListeners();

    if (!isOpen) {
      pendingValue.value = value;
    }

    _fieldState?.widget.onChanged?.call(_value);
  }

  @override
  void submitChanges({bool close = false}) {
    value = pendingValue.value;
    if (close) {
      this.close();
    }
  }

  @override
  void discardChanges({bool close = false}) {
    pendingValue.value = _value;
    if (close) {
      this.close();
    }
  }

  @override
  String buildTitle(List<YgDropdownEntry<T>> entries) {
    final _YgDropdownFieldSingleSelectState<T>? fieldState = _fieldState;
    if (fieldState == null) {
      throw Exception(
        'YgSingleSelectDropdownController.buildTitle was called while the controller was not attached to a single select dropdown!',
      );
    }

    if (value == null) {
      return '';
    }

    final String? metric = fieldState.widget.metric;

    for (final YgDropdownEntry<T> entry in entries) {
      if (entry.value != value) {
        continue;
      }

      if (metric != null) {
        return '${entry.title} $metric';
      }

      return entry.title;
    }

    return '';
  }

  @override
  void onValueTapped(T value, {bool submit = false, bool close = false}) {
    final _YgDropdownFieldSingleSelectState<T>? fieldState = _fieldState;
    assert(
      fieldState != null,
      'YgSingleSelectDropdownController.onValueTapped was called while the controller was not attached to a single select dropdown!',
    );
    if (fieldState == null) {
      return;
    }

    final _YgDropdownFieldSingleSelect<T> widget = fieldState.widget;

    if (pendingValue.value == value) {
      if (!widget.allowDeselect) {
        return;
      }
      pendingValue.value = null;
    } else {
      pendingValue.value = value;
    }

    if (submit) {
      submitChanges(close: close);
    }
  }

  /// Opens the picker specifically.
  ///
  /// Should be called only when the picker specifically should be opened. For
  /// most cases you want to use the [open] method instead to show either a
  /// menu, picker or bottom sheet, depending on the platform the user is on and
  /// the configuration of the widget.
  void openPicker() {
    final _YgDropdownFieldSingleSelectState<T>? field = _fieldState;
    assert(
      field != null,
      'YgDropdownController.openMenu was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    field.openPickerBottomSheet();
  }

  @override
  bool get filled => value != null;

  @override
  bool isValuePendingSelected(T value) => value == pendingValue.value;
}
