part of 'yg_search_field.dart';

// TODO(Tim): Move this to generic factory constructors once this has been
// implemented https://github.com/dart-lang/sdk/issues/30041
class YgStringSearchField extends YgSearchField<String> {
  const YgStringSearchField({
    super.key,
    required super.label,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.resultsBuilder,
    YgStringSearchController? super.controller,
    super.onChanged,
    super.completeAction,
    super.disabled,
    super.error,
    super.focusNode,
    super.hint,
    super.initialQuery,
    super.inputFormatters,
    super.onEditingComplete,
    super.onFocusChanged,
    super.onPressed,
    super.placeholder,
    super.readOnly,
    super.searchAction,
    super.size,
    super.variant,
  }) : super._();

  /// Called to get the results list for the search screen / menu.
  ///
  /// Gets called every time the search text changes, if the previous call
  /// returned a future, this builder will not be called again until that future
  /// has resolved. If the value has changed since the last time this builder was
  /// called, this builder will be called again, only with the most recent value.
  ///
  /// If this builder returns a future, for the duration of the future, a loading
  /// indicator will be shown to the user.
  ///
  /// Results are bound to the [controller], so in case a different controller
  /// gets assigned, the results will also change.
  final YgStringSearchResultsBuilder resultsBuilder;

  @override
  State<YgStringSearchField> createState() => _YgStringSearchFieldState();
}

class _YgStringSearchFieldState extends YgSearchFieldWidgetState<String, YgStringSearchField>
    with YgStringSearchMixin<YgStringSearchField> {
  @override
  YgSearchControllerSimple<String> createController() {
    return YgStringSearchController(
      initialQuery: widget.initialQuery,
    );
  }

  @override
  void onChanged() {
    widget.onChanged?.call(
      _controllerManager.value.textEditingController.text,
    );
  }

  @override
  YgStringSearchResultsBuilder get resultsBuilder => widget.resultsBuilder;
}
