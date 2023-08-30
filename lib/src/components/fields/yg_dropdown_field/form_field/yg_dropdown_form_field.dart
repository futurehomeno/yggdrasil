import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/_fields.dart';
import 'package:yggdrasil/src/components/fields/helpers/_helpers.dart';

import '../../enums/_enums.dart';

part 'yg_dropdown_form_field_multi_select.dart';
part 'yg_dropdown_form_field_single_select.dart';

abstract class YgDropdownFormField<T extends Object> extends StatefulWidget {
  factory YgDropdownFormField({
    required List<YgDropdownEntry<T>> entries,
    required FormFieldKey<T> key,
    required String label,
    int? maxLines,
    int? minLines,
    String? error,
    T? initialValue,
    String? placeholder,
    FocusNode? focusNode,
    List<FormFieldValidator<T?>>? validators,
    YgSingleSelectDropdownController<T>? controller,
    bool disabled,
    bool allowDeselect,
    VoidCallback onPressed,
    YgDropdownFieldSize size,
    YgAutoValidate autoValidate,
    YgCompleteAction completeAction,
    YgDropdownAction dropdownAction,
    YgDropdownFieldVariant variant,
    ValueChanged<bool> onFocusChanged,
  }) = YgDropdownFormFieldSingleSelect<T>;

  factory YgDropdownFormField.multiSelect({
    required List<YgDropdownEntry<T>> entries,
    required MultiSelectKey<T> key,
    required String label,
    String? error,
    int? maxLines,
    int? minLines,
    String? placeholder,
    FocusNode? focusNode,
    Set<T>? initialValue,
    List<FormFieldValidator<Set<T>>>? validators,
    YgMultiSelectDropdownController<T>? controller,
    bool disabled,
    bool allowDeselect,
    VoidCallback onPressed,
    YgDropdownFieldSize size,
    YgAutoValidate autoValidate,
    YgDropdownFieldVariant variant,
    YgDropdownAction dropdownAction,
    YgCompleteAction completeAction,
    ValueChanged<bool> onFocusChanged,
  }) = YgDropdownFormFieldMultiSelect<T>;

  const YgDropdownFormField._({
    super.key,
    required this.entries,
    required this.label,
    required this.disabled,
    required this.dropdownAction,
    required this.maxLines,
    required this.allowDeselect,
    required this.completeAction,
    required this.size,
    required this.variant,
    required this.autoValidate,
    this.error,
    this.focusNode,
    this.minLines,
    this.onFocusChanged,
    this.onPressed,
    this.placeholder,
  })  : enabled = !disabled,
        restorationId = null;

  /// See [YgDropdownField.entries].
  final List<YgDropdownEntry<T>> entries;

  /// See [YgDropdownField.entries].
  final String label;

  /// See [YgDropdownField.entries].
  final YgDropdownFieldVariant variant;

  /// See [YgDropdownField.entries].
  final YgDropdownFieldSize size;

  /// See [YgDropdownField.entries].
  final FocusNode? focusNode;

  /// See [YgDropdownField.entries].
  final String? error;

  /// See [YgDropdownField.entries].
  final int? minLines;

  /// See [YgDropdownField.entries].
  final String? placeholder;

  /// See [YgDropdownField.entries].
  final int? maxLines;

  /// See [YgDropdownField.entries].
  final bool disabled;

  /// See [YgDropdownField.entries].
  final bool allowDeselect;

  /// See [YgDropdownField.entries].
  final YgDropdownAction dropdownAction;

  /// See [YgDropdownField.onFocusChanged].
  final ValueChanged<bool>? onFocusChanged;

  /// See [YgDropdownField.onPressed].
  final VoidCallback? onPressed;

  final YgCompleteAction completeAction;

  final YgAutoValidate autoValidate;

  final bool enabled;

  final String? restorationId;
}
