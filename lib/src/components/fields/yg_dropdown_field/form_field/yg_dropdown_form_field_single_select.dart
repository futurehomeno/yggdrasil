// ignore_for_file: avoid-stateless-widget-initialized-fields

part of 'yg_dropdown_form_field.dart';

class YgDropdownFormFieldSingleSelect<T extends Object> extends YgDropdownFormField<T> implements FormField<T?> {
  YgDropdownFormFieldSingleSelect({
    required FormFieldKey<T> key,
    required this.entries,
    required this.label,
    this.focusNode,
    this.initialValue,
    this.error,
    this.minLines,
    this.placeholder,
    this.onChange,
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
  late final FormFieldBuilder<T?> builder = (FormFieldState<T?> field) {
    return UnmanagedRestorationScope(
      bucket: field.bucket,
      child: YgDropdownField(
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
        onChange: onChange,
      ),
    );
  };

  @override
  final bool enabled;

  @override
  final T? initialValue;

  @override
  final FormFieldSetter<T>? onSaved = null;

  @override
  final String? restorationId = null;

  @override
  final FormFieldValidator<T>? validator;

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
  final ValueChanged<T?>? onChange;
  final List<FormFieldValidator<T>>? validators;
  final YgAutoValidate autoValidate;

  @override
  FormFieldState<T?> createState() {
    return FormFieldState<T?>();
  }
}
