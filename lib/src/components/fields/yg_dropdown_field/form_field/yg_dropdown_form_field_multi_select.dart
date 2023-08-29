part of 'yg_dropdown_form_field.dart';

// ignore_for_file: avoid-stateless-widget-initialized-fields

class YgDropdownFormFieldMultiSelect<T extends Object> extends YgDropdownFormField<T> implements FormField<Set<T>> {
  YgDropdownFormFieldMultiSelect({
    required FormFieldKey<T> key,
    required this.entries,
    required this.label,
    this.focusNode,
    this.initialValue,
    this.error,
    this.minLines,
    this.placeholder,
    this.maxLines = 1,
    this.disabled = false,
    this.allowDeselect = false,
    this.variant = YgDropdownFieldVariant.standard,
    this.size = YgDropdownFieldSize.large,
    this.dropdownAction = YgDropdownAction.auto,
    List<FormFieldValidator<Set<T>>>? validators,
    YgAutoValidate autoValidate = YgAutoValidate.disabled,
  })  : enabled = !disabled,
        validator = YgValidateHelper.combineValidators(validators),
        autovalidateMode = YgValidateHelper.mapAutoValidate(autoValidate),
        super._(key: key);

  @override
  final AutovalidateMode autovalidateMode;

  @override
  late final FormFieldBuilder<Set<T>?> builder = (FormFieldState<Set<T>?> field) {
    return UnmanagedRestorationScope(
      bucket: field.bucket,
      child: YgDropdownField<T>.multiSelect(
        entries: entries,
        label: label,
        variant: variant,
        size: size,
        focusNode: focusNode,
        initialValue: initialValue,
        error: error,
        minLines: minLines,
        placeholder: placeholder,
        maxLines: maxLines,
        disabled: disabled,
        allowDeselect: allowDeselect,
        dropdownAction: dropdownAction,
        onChange: field.didChange,
      ),
    );
  };

  @override
  final bool enabled;

  @override
  final Set<T>? initialValue;

  @override
  final FormFieldSetter<Set<T>>? onSaved = null;

  @override
  final String? restorationId = null;

  @override
  final FormFieldValidator<Set<T>>? validator;

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
  final int maxLines;

  /// See [YgDropdownField.entries].
  final bool disabled;

  /// See [YgDropdownField.entries].
  final bool allowDeselect;

  /// See [YgDropdownField.entries].
  final YgDropdownAction dropdownAction;

  @override
  FormFieldState<Set<T>> createState() {
    return FormFieldState<Set<T>>();
  }
}
