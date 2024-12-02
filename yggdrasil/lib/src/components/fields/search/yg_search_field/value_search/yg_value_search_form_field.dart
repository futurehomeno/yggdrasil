part of '../yg_search_form_field.dart';

class _YgValueSearchFormField<T> extends YgSearchFormField<T> {
  _YgValueSearchFormField({
    required FormFieldKey<T> super.key,
    required super.autocorrect,
    required super.keyboardType,
    required super.label,
    required super.textCapitalization,
    required this.searchProvider,
    this.controller,
    super.initialValue,
    super.error,
    super.focusNode,
    super.hint,
    super.inputFormatters,
    super.onChanged,
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
    List<FormFieldValidator<T>>? validators,
  }) : super._();

  final YgAdvancedSearchProvider<T> searchProvider;

  final YgAdvancedSearchController<T>? controller;

  @override
  FormFieldBuilder<T> get builder => _builder;
  Widget _builder(FormFieldState<T> field) {
    final YgValidateHelper<T> helper = YgValidateHelper<T>(
      key: key as FormFieldKey<T>,
      autoValidate: autoValidate,
      onFocusChanged: onFocusChanged,
      completeAction: completeAction,
      onEditingComplete: onEditingComplete,
    );

    void onChangedHandler(T value) {
      field.didChange(value);
      onChanged?.call(value);
    }

    return UnmanagedRestorationScope(
      bucket: field.bucket,
      child: YgSearchField<T>(
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
        initialValue: initialValue,
        onFocusChanged: helper.onFocusChanged,
        onEditingComplete: helper.onEditingComplete,
      ),
    );
  }
}
