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
  void onEntryTapped(YgDropdownEntry<T> entry) {
    final _YgDropdownFieldSingleSelectState<T>? fieldState = _fieldState;
    assert(
      fieldState != null,
      'YgSingleSelectDropdownController.onEntryTapped was called while the controller was not attached to a single select dropdown!',
    );
    if (fieldState == null) {
      return;
    }

    final _YgDropdownFieldSingleSelect<T> widget = fieldState.widget;

    if (value == entry.value) {
      if (!widget.allowDeselect) {
        return;
      }
      value = null;
    } else {
      value = entry.value;
    }

    widget.onChange?.call(value);
    close();
  }

  @override
  bool get filled => value != null;

  @override
  bool isEntrySelected(YgDropdownEntry<T> entry) => entry.value == value;
}
