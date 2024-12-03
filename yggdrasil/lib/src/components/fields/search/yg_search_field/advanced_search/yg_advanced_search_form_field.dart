part of '../yg_search_form_field.dart';

class _YgAdvancedSearchFormField<Value, ResultValue> extends YgSearchFormField<Value> {
  _YgAdvancedSearchFormField({
    required FormFieldKey<Value> super.key,
    required super.autocorrect,
    required super.keyboardType,
    required super.label,
    required super.textCapitalization,
    required this.searchProvider,
    this.controller,
    super.error,
    super.focusNode,
    super.hint,
    super.inputFormatters,
    super.onEditingComplete,
    super.onFocusChanged,
    super.onPressed,
    super.placeholder,
    super.disabled,
    super.readOnly,
    super.variant,
    super.size,
    super.completeAction,
    super.searchAction,
    super.autoValidate,
    this.onChanged,
    YgSearchValueAndText<Value>? initialValue,
    List<FormFieldValidator<Value>>? validators,
  })  : _initialValueInternal = initialValue,
        initialValue = initialValue?.value,
        super._();

  final YgAdvancedSearchController<Value, ResultValue>? controller;

  final YgAdvancedSearchProvider<Value, ResultValue> searchProvider;

  final YgSearchValueAndText<Value>? _initialValueInternal;

  @override
  final Value? initialValue;

  final ValueChanged<Value?>? onChanged;

  @override
  FormFieldBuilder<Value> get builder => _builder;
  Widget _builder(FormFieldState<Value> field) {
    final YgValidateHelper<Value> helper = YgValidateHelper<Value>(
      key: key as FormFieldKey<Value>,
      autoValidate: autoValidate,
      onFocusChanged: onFocusChanged,
      completeAction: completeAction,
      onEditingComplete: onEditingComplete,
    );

    void onChangedHandler(Value? value) {
      field.didChange(value);
      onChanged?.call(value);
    }

    return UnmanagedRestorationScope(
      bucket: field.bucket,
      child: YgAdvancedSearchField<Value, ResultValue>(
        autocorrect: autocorrect,
        keyboardType: keyboardType,
        label: label,
        textCapitalization: textCapitalization,
        searchProvider: searchProvider,
        controller: controller,
        error: field.errorText,
        focusNode: focusNode,
        hint: hint,
        inputFormatters: inputFormatters,
        onChanged: onChangedHandler,
        onPressed: onPressed,
        placeholder: placeholder,
        disabled: disabled,
        readOnly: readOnly,
        variant: variant,
        size: size,
        completeAction: completeAction,
        searchAction: searchAction,
        initialValue: _initialValueInternal,
        onFocusChanged: helper.onFocusChanged,
        onEditingComplete: helper.onEditingComplete,
      ),
    );
  }
}
