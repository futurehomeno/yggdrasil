part of '../yg_search_form_field.dart';

/// The advanced search variation of the yggdrasil search form field.
///
/// This version of the search form field allows for the value of the search field to be
/// different from the value of the search results. This is useful in case the
/// search results lack important data needed for the final value of the widget,
/// which will be fetched separately.
///
/// If you want the value of the search form field to be identical to the value of the
/// selected result, use the [YgSearchFormField] instead.
///
/// If you want to search for any string, use [YgStringSearchFormField] instead.
class YgAdvancedSearchFormField<Value, ResultValue> extends YgSearchFormField<Value> {
  YgAdvancedSearchFormField({
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

  /// Optional controller to control this widget.
  ///
  /// When provided, overwrites the [initialValue] with the initial value passed
  /// to the controller.
  final YgAdvancedSearchController<Value, ResultValue>? controller;

  /// The search provider for this widget.
  final YgAdvancedSearchProvider<Value, ResultValue> searchProvider;

  /// The initial value of the widget.
  ///
  /// This value is ignored if [controller] is provided.
  final YgSearchValueAndText<Value>? _initialValueInternal;

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
