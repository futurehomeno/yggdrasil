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
    this.validators,
    this.maxLines = 1,
    this.disabled = false,
    this.allowDeselect = false,
    this.variant = YgDropdownFieldVariant.standard,
    this.size = YgDropdownFieldSize.large,
    this.dropdownAction = YgDropdownAction.auto,
    this.autoValidate = YgAutoValidate.disabled,
  })  : enabled = !disabled,
        validator = YgValidateHelper.combineValidators(validators),
        autovalidateMode = YgValidateHelper.mapAutoValidate(autoValidate),
        super._(key: key);

  // region Override

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

  // endregion

  final List<YgDropdownEntry<T>> entries;
  final String label;
  final YgDropdownFieldVariant variant;
  final YgDropdownFieldSize size;
  final FocusNode? focusNode;
  final String? error;
  final int? minLines;
  final String? placeholder;
  final int maxLines;
  final bool disabled;
  final bool allowDeselect;
  final YgDropdownAction dropdownAction;
  final List<FormFieldValidator<Set<T>>>? validators;
  final YgAutoValidate autoValidate;

  @override
  FormFieldState<Set<T>> createState() {
    return FormFieldState<Set<T>>();
  }
}
