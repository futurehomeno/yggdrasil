part of 'yg_search_bar.dart';

class _YgValueSearchBar<T> extends YgSearchBar<T> {
  const _YgValueSearchBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.resultTextBuilder,
    required this.resultsBuilder,
    YgValueSearchController<T>? super.controller,
    super.automaticallyImplyLeading,
    super.completeAction,
    super.error,
    super.focusNode,
    super.hint,
    super.initialQuery,
    super.inputFormatters,
    super.leading,
    super.onChanged,
    super.onEditingComplete,
    super.onFocusChanged,
    super.onPressed,
    super.placeholder,
    super.searchAction,
    super.showSearchIcon,
    super.size,
    super.trailing,
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
  State<_YgValueSearchBar<T>> createState() => _YgValueSearchBarWidgetState<T>();
}

class _YgValueSearchBarWidgetState<T> extends YgSearchBarWidgetState<T, _YgValueSearchBar<T>> {
  @override
  YgSearchControllerSimple<T> createController() {
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
}
