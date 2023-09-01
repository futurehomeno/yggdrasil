part of '../yg_dropdown_field.dart';

class _YgDropdownFormFieldMultiSelect<T extends Object> extends YgDropdownFormField<T> implements FormField<Set<T>> {
  _YgDropdownFormFieldMultiSelect({
    required MultiSelectKey<T> key,
    required super.entries,
    required super.label,
    super.focusNode,
    super.error,
    super.minLines,
    super.placeholder,
    super.maxLines,
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
        _key = key,
        super._(
          key: key,
        );

  Widget _builder(FormFieldState<Set<T>?> field) {
    final YgValidateHelper<Set<T>> helper = YgValidateHelper<Set<T>>(
      key: _key,
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
        error: error ?? field.errorText,
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
  }

  @override
  // ignore: avoid-stateless-widget-initialized-fields
  late final FormFieldBuilder<Set<T>?> builder = _builder;

  @override
  final AutovalidateMode autovalidateMode;

  @override
  final Set<T>? initialValue;

  @override
  final FormFieldValidator<Set<T>>? validator;

  final YgMultiSelectDropdownController<T>? controller;

  @override
  final FormFieldSetter<Set<T>>? onSaved;

  final MultiSelectKey<T> _key;

  @override
  FormFieldState<Set<T>> createState() {
    return FormFieldState<Set<T>>();
  }
}
