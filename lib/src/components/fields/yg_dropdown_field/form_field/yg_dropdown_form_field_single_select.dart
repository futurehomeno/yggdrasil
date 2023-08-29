// ignore_for_file: avoid-stateless-widget-initialized-fields

part of 'yg_dropdown_form_field.dart';

class YgDropdownFormFieldSingleSelect<T extends Object> extends YgDropdownFormField<T> implements FormField<T?> {
  YgDropdownFormFieldSingleSelect({
    required this.key,
    required super.entries,
    required super.label,
    super.focusNode,
    super.error,
    super.minLines,
    super.placeholder,
    super.maxLines = 1,
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
    List<FormFieldValidator<T>>? validators,
  })  : onSaved = null,
        validator = YgValidateHelper.combineValidators(validators),
        autovalidateMode = YgValidateHelper.mapAutoValidate(autoValidate),
        super._();

  @override
  final AutovalidateMode autovalidateMode;

  @override
  late final FormFieldBuilder<T?> builder = (FormFieldState<T?> field) {
    final YgValidateHelper helper = YgValidateHelper<Set<T>>(
      key: key,
      autoValidate: autoValidate,
      onFocusChanged: onFocusChanged,
      completeAction: completeAction,
      onEditingComplete: null,
    );

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
        onChange: field.didChange,
        controller: controller,
        onFocusChanged: helper.onFocusChanged,
        onPressed: onPressed,
      ),
    );
  };

  @override
  final T? initialValue;

  @override
  final FormFieldValidator<T>? validator;

  final YgSingleSelectDropdownController<T>? controller;

  final FormFieldSetter<T?>? onSaved;

  final FormFieldKey<Set<T>> key;

  @override
  FormFieldState<T?> createState() {
    return FormFieldState<T?>();
  }
}
