part of '../yg_search_form_field.dart';

/// The string search variation of the yggdrasil search form field.
///
/// This version of the search form field guarantees the value of the search field is
/// identical to the search query entered by the user. This version of the
/// search form field does not require the user to select a result in order to have a
/// value. Selecting a result however will set the current value and search
/// query to the title of the selected search result.
///
/// If you want to search for strings, but want to limit the accepted values to
/// only the result values, use [YgSearchFormField] with a type of string instead.
///
/// For advanced search implementation, use [YgAdvancedSearchFormField] instead.
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
    super.validators,
    this.controller,
    this.initialValue,
    this.onChanged,
  }) : super._();

  /// The search provider for this widget.
  final YgStringSearchProvider searchProvider;

  /// Optional controller to control this widget.
  ///
  /// When provided, overwrites the [initialValue] with the initial value passed
  /// to the controller.
  final YgStringSearchController? controller;

  /// Optional callback called whenever the value changes.
  final ValueChanged<String>? onChanged;

  @override
  final String? initialValue;

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
