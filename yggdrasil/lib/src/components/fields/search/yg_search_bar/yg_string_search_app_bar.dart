part of 'yg_search_app_bar.dart';

class YgStringSearchAppBar extends YgSearchAppBar<String> {
  const YgStringSearchAppBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.resultsBuilder,
    YgStringSearchController? super.controller,
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
  final YgStringSearchResultsBuilder resultsBuilder;

  @override
  State<YgStringSearchAppBar> createState() => YgStringSearchAppBarState();
}

class YgStringSearchAppBarState extends YgSearchAppBarState<String, YgStringSearchAppBar> {
  @override
  Widget buildSearchBar(Widget? leading) {
    return YgStringSearchBar(
      keyboardType: widget.keyboardType,
      autocorrect: widget.autocorrect,
      textCapitalization: widget.textCapitalization,
      focusNode: widget.focusNode,
      error: widget.error,
      placeholder: widget.placeholder,
      onFocusChanged: widget.onFocusChanged,
      onPressed: widget.onPressed,
      controller: widget.controller as YgStringSearchController?,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      hint: widget.hint,
      inputFormatters: widget.inputFormatters,
      initialQuery: widget.initialQuery,
      leading: leading,
      trailing: widget.trailing,
      completeAction: widget.completeAction,
      searchAction: widget.searchAction,
      resultsBuilder: widget.resultsBuilder,
    );
  }
}
