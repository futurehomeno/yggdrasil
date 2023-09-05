part of '../yg_dropdown_field.dart';

class _YgDropdownFormFieldSingleSelect<T extends Object> extends YgDropdownFormField<T> implements FormField<T> {
  _YgDropdownFormFieldSingleSelect({
    required FormFieldKey<T> key,
    required super.entries,
    required super.label,
    super.focusNode,
    super.error,
    super.minLines,
    super.placeholder,
    super.maxLines = 1,
    super.disabled = false,
    super.allowDeselect = false,
    super.variant = YgFieldVariant.standard,
    super.size = YgFieldSize.large,
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
        _key = key,
        super._(
          key: key,
        );

  Widget _builder(FormFieldState<T?> field) {
    final YgValidateHelper<T> helper = YgValidateHelper<T>(
      key: _key,
      autoValidate: autoValidate,
      onFocusChanged: onFocusChanged,
      completeAction: completeAction,
      onEditingComplete: null,
    );

    return UnmanagedRestorationScope(
      bucket: field.bucket,
      child: YgDropdownField<T>(
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
        onEditingComplete: helper.onEditingComplete,
        onPressed: onPressed,
      ),
    );
  }

  @override
  // ignore: avoid-stateless-widget-initialized-fields
  late final FormFieldBuilder<T?> builder = _builder;

  @override
  final AutovalidateMode autovalidateMode;

  @override
  final T? initialValue;

  @override
  final FormFieldValidator<T>? validator;

  @override
  final FormFieldSetter<T?>? onSaved;

  /// The controller of the field.
  ///
  /// See [YgDropdownController] for more information on how to use it.
  final YgSingleSelectDropdownController<T>? controller;

  final FormFieldKey<T> _key;

  @override
  FormFieldState<T> createState() {
    return FormFieldState<T>();
  }
}
