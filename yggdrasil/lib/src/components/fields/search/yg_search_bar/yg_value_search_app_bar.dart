part of 'yg_search_app_bar.dart';

class YgValueSearchAppBar<T> extends YgSearchAppBar<T> {
  const YgValueSearchAppBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.resultTextBuilder,
    required this.resultsBuilder,
    YgValueSearchController<T>? super.controller,
    super.focusNode,
    super.error,
    super.placeholder,
    super.onFocusChanged,
    super.onPressed,
    super.onEditingComplete,
    super.onChanged,
    super.hint,
    super.inputFormatters,
    super.initialQuery,
    super.leading,
    super.trailing,
    super.showSearchIcon,
    super.variant,
    super.completeAction,
    super.searchAction,
    super.automaticallyImplyLeading,
  });

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

  @override
  State<YgValueSearchAppBar<T>> createState() => YgValueSearchAppBarState<T>();
}

class YgValueSearchAppBarState<T> extends YgSearchAppBarState<T, YgValueSearchAppBar<T>> {
  @override
  Widget buildSearchBar(Widget? leading) {
    return YgSearchBar<T>(
      keyboardType: widget.keyboardType,
      autocorrect: widget.autocorrect,
      textCapitalization: widget.textCapitalization,
      focusNode: widget.focusNode,
      error: widget.error,
      placeholder: widget.placeholder,
      onFocusChanged: widget.onFocusChanged,
      onPressed: widget.onPressed,
      controller: widget.controller as YgValueSearchController<T>?,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      hint: widget.hint,
      inputFormatters: widget.inputFormatters,
      initialQuery: widget.initialQuery,
      leading: leading,
      trailing: widget.trailing,
      completeAction: widget.completeAction,
      searchAction: widget.searchAction,
      resultTextBuilder: widget.resultTextBuilder,
      resultsBuilder: widget.resultsBuilder,
    );
  }
}
