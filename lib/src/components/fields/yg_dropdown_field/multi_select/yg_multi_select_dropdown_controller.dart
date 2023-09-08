part of '../yg_dropdown_field.dart';

/// The controller for a [YgDropdownField.multiSelect]
class YgMultiSelectDropdownController<T extends Object> extends YgDropdownController<T, Set<T>, _YgDropdownFieldMultiSelect<T>> {
  YgMultiSelectDropdownController({
    Set<T>? initialValue,
  }) : super(
          initialValue: initialValue ?? <T>{},
        );

  @override
  String buildTitle(List<YgDropdownEntry<T>> entries) {
    final List<String> titles = <String>[];

    for (final YgDropdownEntry<T> entry in entries) {
      if (value.contains(entry.value)) {
        titles.add(entry.title);
      }
    }

    return titles.join(', ');
  }

  @override
  void onEntryTapped(YgDropdownEntry<T> entry) {
    final YgDropdownFieldState<T, YgDropdownField<T>>? field = _field;

    assert(
      field is _YgDropdownFieldMultiSelectState<T>,
      'YgDropdownController.onEntryTapped was called while the controller was not attached to a multi select dropdown!',
    );
    if (field is! _YgDropdownFieldMultiSelectState<T>) {
      return;
    }

    if (value.contains(entry.value)) {
      if (field.widget.allowDeselect || value.length > 1) {
        value.remove(entry.value);
        field.widget.onChange?.call(value);

        notifyListeners();
      }
    } else {
      value.add(entry.value);
      field.widget.onChange?.call(value);

      notifyListeners();
    }
  }

  bool add(T newValue) {
    final bool added = value.add(newValue);

    if (added) {
      notifyListeners();
    }

    return added;
  }

  bool remove(T newValue) {
    final bool removed = value.remove(newValue);

    if (removed) {
      notifyListeners();
    }

    return removed;
  }

  void clear() {
    value.clear();
    notifyListeners();
  }

  @override
  bool get filled => value.isNotEmpty;

  @override
  bool isEntrySelected(YgDropdownEntry<T> entry) => value.contains(entry.value);
}
