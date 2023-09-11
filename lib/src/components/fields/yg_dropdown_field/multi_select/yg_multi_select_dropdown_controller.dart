part of '../yg_dropdown_field.dart';

/// The controller for a [YgDropdownField.multiSelect]
class YgMultiSelectDropdownController<T extends Object>
    extends YgDropdownController<T, Set<T>, _YgDropdownFieldMultiSelectState<T>> {
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
    final _YgDropdownFieldMultiSelectState<T>? fieldState = _fieldState;

    assert(
      fieldState != null,
      'YgMultiSelectDropdownController.onEntryTapped was called while the controller was not attached to a multi select dropdown!',
    );
    if (fieldState == null) {
      return;
    }

    final _YgDropdownFieldMultiSelect<T> widget = fieldState.widget;

    if (value.contains(entry.value)) {
      if (!widget.allowDeselect && value.length < 2) {
        return;
      }

      value.remove(entry.value);
    } else {
      value.add(entry.value);
    }

    widget.onChange?.call(value);

    notifyListeners();
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
