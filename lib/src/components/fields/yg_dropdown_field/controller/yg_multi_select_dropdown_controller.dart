part of 'yg_dropdown_controller.dart';

class YgMultiSelectDropdownController<T extends Object> extends YgDropdownController<T, Set<T>> {
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
      field != null,
      'YgDropdownController.onEntryTapped was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    if (value.contains(entry.value)) {
      if (field.widget.allowDeselect || value.length > 1) {
        value.remove(entry.value);
        notifyListeners();
      }
    } else {
      value.add(entry.value);
      notifyListeners();
    }
  }

  @override
  bool get filled => value.isNotEmpty;

  @override
  bool isEntrySelected(YgDropdownEntry<T> entry) => value.contains(entry.value);
}
