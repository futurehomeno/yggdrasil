part of '../yg_dropdown_field.dart';

/// The controller for a [YgDropdownField].
class YgSingleSelectDropdownController<T extends Object> extends YgDropdownController<T, T?> {
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
    final YgDropdownFieldState<T, YgDropdownField<T>>? field = _field;
    assert(
      field != null,
      'YgDropdownController.onEntryTapped was called while the controller was not attached to a single select dropdown!',
    );
    if (field is! _YgDropdownFieldSingleSelectState<T>) {
      return;
    }

    if (value == entry.value) {
      if (field.widget.allowDeselect) {
        value = null;
        field.widget.onChange?.call(value);

        close();
      }
    } else {
      value = entry.value;
      field.widget.onChange?.call(value);

      close();
    }
  }

  @override
  bool get filled => value != null;

  @override
  bool isEntrySelected(YgDropdownEntry<T> entry) => entry.value == value;
}
