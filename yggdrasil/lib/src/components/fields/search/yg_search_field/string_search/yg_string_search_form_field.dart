part of '../yg_search_form_field.dart';

class YgStringSearchFormField extends YgSearchFormField<String> {
  YgStringSearchFormField({
    required TextFieldKey super.key,
    required super.autocorrect,
    required super.keyboardType,
    required super.label,
    required super.textCapitalization,
    required this.searchProvider,
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
    super.initialValue,
    super.validators,
    this.controller,
  }) : super._();

  final YgStringSearchProvider searchProvider;

  final YgStringSearchController? controller;

  @override
  FormFieldBuilder<String> get builder => _builder;
  Widget _builder(FormFieldState<String> field) {
    final YgValidateHelper<String> helper = YgValidateHelper<String>(
      key: key as TextFieldKey,
      autoValidate: autoValidate,
      onFocusChanged: onFocusChanged,
      completeAction: completeAction,
      onEditingComplete: onEditingComplete,
    );

    void onChangedHandler(String value) {
      field.didChange(value);
      onChanged?.call(value);
    }

    return UnmanagedRestorationScope(
      bucket: field.bucket,
      child: YgStringSearchField(
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
