part of 'yg_search_field.dart';

class _YgValueSearchField<T> extends YgSearchField<T> {
  const _YgValueSearchField({
    super.key,
    required super.label,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.resultsBuilder,
    required this.resultTextBuilder,
    YgValueSearchController<T>? super.controller,
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
    this.initialValue,
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
  final YgValueSearchResultsBuilder<T> resultsBuilder;

  /// Called to get the result text once a result has been selected.
  ///
  /// In the case this widget returns a string, the search text will be updated
  /// to this string, in case this builder returns null, the most recent value
  /// entered by the user will be shown in the search field.
  ///
  /// If this builder returns a future, a loading indicator will be shown to the
  /// user until this future resolves.
  final YgValueSearchResultTextBuilder<T> resultTextBuilder;

  final T? initialValue;

  @override
  State<YgSearchField<T>> createState() => _YgValueSearchFieldState<T>();
}

class _YgValueSearchFieldState<T> extends YgSearchFieldWidgetState<T, _YgValueSearchField<T>>
    with YgValueSearchMixin<T, _YgValueSearchField<T>> {
  @override
  YgSearchControllerAny<T> createController() {
    return YgValueSearchController<T>(
      initialQuery: widget.initialQuery,
      initialValue: widget.initialValue,
    );
  }

  @override
  void onChanged() {
    final Object? value = _controllerManager.value.value;

    // This should never happen.
    assert(value is T);
    if (value is! T) {
      return;
    }

    widget.onChanged?.call(
      _controllerManager.value.value as T,
    );
  }

  @override
  YgValueSearchResultTextBuilder<T> get resultTextBuilder => widget.resultTextBuilder;

  @override
  YgValueSearchResultsBuilder<T> get resultsBuilder => widget.resultsBuilder;
}
