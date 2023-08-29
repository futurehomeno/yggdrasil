part of 'yg_dropdown_form_field.dart';

// ignore_for_file: avoid-stateless-widget-initialized-fields

class YgDropdownFormFieldMultiSelect<T extends Object> extends YgDropdownFormField<T> implements FormField<Set<T>> {
  YgDropdownFormFieldMultiSelect({
    required this.key,
    required super.entries,
    required super.label,
    super.focusNode,
    super.error,
    super.minLines,
    super.placeholder,
    super.maxLines = null,
    super.disabled = false,
    super.allowDeselect = false,
    super.variant = YgDropdownFieldVariant.standard,
    super.size = YgDropdownFieldSize.large,
    super.dropdownAction = YgDropdownAction.auto,
    super.autoValidate = YgAutoValidate.disabled,
    super.completeAction = YgCompleteAction.unfocus,
    super.onFocusChanged,
    super.onPressed,
    this.initialValue,
    this.controller,
    List<FormFieldValidator<Set<T>>>? validators,
  })  : validator = YgValidateHelper.combineValidators(validators),
        autovalidateMode = YgValidateHelper.mapAutoValidate(autoValidate),
        onSaved = null,
        super._(key: key);

  @override
  final AutovalidateMode autovalidateMode;

  @override
  late final FormFieldBuilder<Set<T>?> builder = (FormFieldState<Set<T>?> field) {
    final YgValidateHelper helper = YgValidateHelper<T>(
      key: key,
      autoValidate: autoValidate,
      onFocusChanged: onFocusChanged,
      completeAction: completeAction,
      onEditingComplete: null,
    );

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
        controller: controller,
        onFocusChanged: helper.onFocusChanged,
        onPressed: onPressed,
      ),
    );
  };

  @override
  final Set<T>? initialValue;

  @override
  final FormFieldValidator<Set<T>>? validator;

  final YgMultiSelectDropdownController<T>? controller;

  final FormFieldSetter<Set<T>>? onSaved;

  final FormFieldKey<T> key;

  @override
  FormFieldState<Set<T>> createState() {
    return FormFieldState<Set<T>>();
  }
}
