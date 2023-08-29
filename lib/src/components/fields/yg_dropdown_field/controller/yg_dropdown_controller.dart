import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_multi_select_dropdown_controller.dart';
part 'yg_single_select_dropdown_controller.dart';

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

  YgDropdownFieldState? _field;

  void attach(YgDropdownFieldState field) {
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

  void openMenu(BuildContext context) {
    final field = _field;
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
    final field = _field;
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
    final field = _field;
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
    final field = _field;
    assert(
      field != null,
      'YgDropdownController.close was called while the controller was not attached to a dropdown!',
    );
    if (field == null) {
      return;
    }

    field.close();
  }
}
