part of '../yg_dropdown_field.dart';

/// The controller for a [YgDropdownField].
class YgSingleSelectDropdownController<T extends Object>
    extends YgDropdownController<T, T?, _YgDropdownFieldSingleSelectState<T>> {
  YgSingleSelectDropdownController({
    super.initialValue,
  });

  @override
  String buildTitle(List<YgDropdownEntry<T>> entries) {
    if (value == null) {
      return '';
    }

    for (final YgDropdownEntry<T> entry in entries) {
      if (entry.value == value) {
        return entry.title;
      }
    }

    return '';
  }

  @override
  void onValueTapped(T value) {
    final _YgDropdownFieldSingleSelectState<T>? fieldState = _fieldState;
    assert(
      fieldState != null,
      'YgSingleSelectDropdownController.onValueTapped was called while the controller was not attached to a single select dropdown!',
    );
    if (fieldState == null) {
      return;
    }

    final _YgDropdownFieldSingleSelect<T> widget = fieldState.widget;

    if (this.value == value) {
      if (!widget.allowDeselect) {
        return;
      }
      this.value = null;
    } else {
      this.value = value;
    }

    widget.onChange?.call(value);
    close();
  }

  @override
  bool get filled => value != null;

  @override
  bool isValueSelected(T value) => value == this.value;
}
