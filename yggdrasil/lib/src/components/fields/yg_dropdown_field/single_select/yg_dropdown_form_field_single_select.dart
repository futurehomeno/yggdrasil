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
    super.onEditingComplete,
    super.metric,
    this.initialValue,
    this.controller,
    this.onChanged,
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
      onEditingComplete: onEditingComplete,
    );

    void onChangedHandler(T? value) {
      field.didChange(value);
      onChanged?.call(value);
    }

    return UnmanagedRestorationScope(
      bucket: field.bucket,
      child: YgDropdownField<T>(
        entries: entries,
        label: label,
        variant: variant,
        size: size,
        focusNode: focusNode,
        initialValue: initialValue,
        error: field.errorText,
        minLines: minLines,
        placeholder: placeholder,
        maxLines: maxLines,
        disabled: disabled,
        allowDeselect: allowDeselect,
        dropdownAction: dropdownAction,
        onChanged: onChangedHandler,
        controller: controller,
        onFocusChanged: helper.onFocusChanged,
        onEditingComplete: helper.onEditingComplete,
        onPressed: onPressed,
        metric: metric,
      ),
    );
  }

  @override
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

  /// Called with the new value when the value has changed.
  final ValueChanged<T?>? onChanged;

  final FormFieldKey<T> _key;

  @override
  FormFieldState<T> createState() {
    return FormFieldState<T>();
  }
}
