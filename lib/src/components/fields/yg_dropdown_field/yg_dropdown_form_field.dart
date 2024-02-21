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
    String? metric,
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
    VoidCallback onEditingComplete,
  }) = _YgDropdownFormFieldSingleSelect<T>;

  factory YgDropdownFormField.multiSelect({
    required List<YgDropdownEntry<T>> entries,
    required MultiSelectKey<T> key,
    required String label,
    String? error,
    int? maxLines,
    int? minLines,
    String? placeholder,
    String? metric,
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
    VoidCallback onEditingComplete,
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
    required this.onEditingComplete,
    required this.metric,
  })  : enabled = !disabled,
        restorationId = null;

  /// See [YgDropdownField.metric].
  final String? metric;

  /// See [YgDropdownField.entries].
  final List<YgDropdownEntry<T>> entries;

  /// See [YgDropdownField.label].
  final String label;

  /// See [YgDropdownField.variant].
  final YgFieldVariant variant;

  /// See [YgDropdownField.size].
  final YgFieldSize size;

  /// See [YgDropdownField.focusNode].
  final FocusNode? focusNode;

  /// See [YgDropdownField.error].
  final String? error;

  /// See [YgDropdownField.minLines].
  final int? minLines;

  /// See [YgDropdownField.placeholder].
  final String? placeholder;

  /// See [YgDropdownField.maxLines].
  final int? maxLines;

  /// See [YgDropdownField.disabled].
  final bool disabled;

  /// See [YgDropdownField.allowDeselect].
  final bool allowDeselect;

  /// See [YgDropdownField.dropdownAction].
  final YgDropdownAction dropdownAction;

  /// See [YgDropdownField.onFocusChanged].
  final ValueChanged<bool>? onFocusChanged;

  /// See [YgDropdownField.onPressed].
  final VoidCallback? onPressed;

  /// See [YgDropdownField.onEditingComplete].
  final VoidCallback? onEditingComplete;

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
