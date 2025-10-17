part of '../yg_search_form_field.dart';

/// Internal implementation of the [YgSearchFormField].
class _YgSimpleSearchFormField<Value> extends YgSearchFormField<Value> {
  _YgSimpleSearchFormField({
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
    this.initialValue,
    this.onChanged,
    List<FormFieldValidator<Value>>? validators,
  }) : super._();

  /// Optional controller to control this widget.
  ///
  /// When provided, overwrites the [initialValue] with the initial value passed
  /// to the controller.
  final YgSimpleSearchController<Value>? controller;

  /// The search provider for this widget.
  final YgSimpleSearchProvider<Value> searchProvider;

  /// Optional callback called whenever the value changes.
  final ValueChanged<Value?>? onChanged;

  @override
  final Value? initialValue;

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
      child: YgSearchField<Value>(
        autocorrect: autocorrect,
        keyboardType: keyboardType,
        label: label,
        textCapitalization: textCapitalization,
        searchProvider: searchProvider,
        controller: controller,
        error: field.errorText,
        focusNode: focusNode,
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
        initialValue: initialValue,
        onFocusChanged: helper.onFocusChanged,
        onEditingComplete: helper.onEditingComplete,
      ),
    );
  }

  @override
  FormFieldErrorBuilder get errorBuilder => (BuildContext context, String errorText) {
    return const SizedBox.shrink();
  };
}
