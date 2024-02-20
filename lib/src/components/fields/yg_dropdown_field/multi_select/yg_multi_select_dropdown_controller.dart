part of '../yg_dropdown_field.dart';

/// The controller for a [YgDropdownField.multiSelect]
class YgMultiSelectDropdownController<T extends Object>
    extends YgDropdownController<T, Set<T>, _YgDropdownFieldMultiSelectState<T>> {
  YgMultiSelectDropdownController({
    Set<T>? initialValue,
  })  : pendingValue = ValueNotifier<Set<T>>(
          Set<T>.of(initialValue ?? <T>{}),
        ),
        super(
          initialValue: Set<T>.of(initialValue ?? <T>{}),
        );

  @override
  final ValueNotifier<Set<T>> pendingValue;

  /// The currently selected value.
  ///
  /// !--- WARNING ---
  /// This is a copy of the selected value, not the value it self, if you want
  /// to add or remove a single value to the set of selected values use the
  /// [add] or [remove] methods instead.
  @override
  Set<T> get value => Set<T>.of(_value);

  @override
  set value(Set<T> newValue) {
    if (setEquals(newValue, _value)) {
      return;
    }

    _value = Set<T>.of(newValue);
    notifyListeners();

    if (!isOpen) {
      pendingValue.value = Set<T>.of(newValue);
    }
  }

  @override
  void submitChanges({bool close = true}) {
    _value = Set<T>.of(pendingValue.value);
    notifyListeners();
    if (close) {
      this.close();
    }
  }

  @override
  void discardChanges({bool close = true}) {
    pendingValue.value = Set<T>.of(_value);
    if (close) {
      this.close();
    }
  }

  @override
  String buildTitle(List<YgDropdownEntry<T>> entries) {
    final _YgDropdownFieldMultiSelectState<T>? fieldState = _fieldState;
    if (fieldState == null) {
      throw Exception(
        'YgMultiSelectDropdownController.buildTitle was called while the controller was not attached to a multi select dropdown!',
      );
    }

    final String? metric = fieldState.widget.metric;
    final List<String> titles = <String>[];

    for (final YgDropdownEntry<T> entry in entries) {
      if (!value.contains(entry.value)) {
        continue;
      }

      if (metric != null) {
        titles.add('${entry.title} $metric');
      }

      titles.add(entry.title);
    }

    return titles.join(', ');
  }

  @override
  void onValueTapped(T value, {bool autoSubmit = false}) {
    final _YgDropdownFieldMultiSelectState<T>? fieldState = _fieldState;

    assert(
      fieldState != null,
      'YgMultiSelectDropdownController.onValueTapped was called while the controller was not attached to a multi select dropdown!',
    );
    if (fieldState == null) {
      return;
    }

    final _YgDropdownFieldMultiSelect<T> widget = fieldState.widget;

    if (pendingValue.value.contains(value)) {
      if (!widget.allowDeselect && pendingValue.value.length < 2) {
        return;
      }

      pendingValue.value.remove(value);
    } else {
      pendingValue.value.add(value);
    }

    pendingValue.notifyListeners();

    if (autoSubmit) {
      submitChanges(
        close: true,
      );
    }
  }

  /// Adds a value to the currently selected values.
  bool add(T newValue) {
    final bool added = value.add(newValue);

    if (added) {
      notifyListeners();
    }

    return added;
  }

  /// Removes a value from the currently selected values.
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
  bool isValuePendingSelected(T value) => pendingValue.value.contains(value);
}
