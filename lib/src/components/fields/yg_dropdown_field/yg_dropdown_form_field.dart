part of 'yg_dropdown_field.dart';

/// The [FormField] variant of the [YgDropdownField].
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
    YgFieldSize size,
    YgAutoValidate autoValidate,
    YgCompleteAction completeAction,
    YgDropdownAction dropdownAction,
    YgFieldVariant variant,
    ValueChanged<bool> onFocusChanged,
  }) = _YgDropdownFormFieldSingleSelect<T>;

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
    YgFieldSize size,
    YgAutoValidate autoValidate,
    YgFieldVariant variant,
    YgDropdownAction dropdownAction,
    YgCompleteAction completeAction,
    ValueChanged<bool> onFocusChanged,
  }) = _YgDropdownFormFieldMultiSelect<T>;

  const YgDropdownFormField._({
    required super.key,
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
    required this.error,
    required this.focusNode,
    required this.minLines,
    required this.onFocusChanged,
    required this.onPressed,
    required this.placeholder,
  })  : enabled = !disabled,
        restorationId = null;

  /// See [YgDropdownField.entries].
  final List<YgDropdownEntry<T>> entries;

  /// See [YgDropdownField.entries].
  final String label;

  /// See [YgDropdownField.entries].
  final YgFieldVariant variant;

  /// See [YgDropdownField.entries].
  final YgFieldSize size;

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

  /// The action which will be executed after the user selects a value.
  ///
  /// For more info see [YgCompleteAction].
  final YgCompleteAction completeAction;

  /// The auto validation mode used.
  ///
  /// For more info see [YgAutoValidate].
  final YgAutoValidate autoValidate;

  // region FormFieldOverrides

  final bool enabled;

  final String? restorationId;

  // endregion
}
