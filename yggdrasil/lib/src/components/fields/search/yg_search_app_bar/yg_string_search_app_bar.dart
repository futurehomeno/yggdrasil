part of 'yg_search_app_bar.dart';

/// The string search variation of the yggdrasil search app bar.
///
/// This version of the search app bar guarantees the value of the search bar is
/// identical to the search query entered by the user. This version of the
/// search app bar does not require the user to select a result in order to have a
/// value. Selecting a result however will set the current value and search
/// query to the title of the selected search result.
///
/// If you want to search for strings, but want to limit the accepted values to
/// only the result values, use [YgSearchAppBar] with a type of string instead.
///
/// For advanced search implementation, use [YgAdvancedSearchAppBar] instead.
class YgStringSearchAppBar extends YgSearchAppBar<String> {
  /// Creates a string search app bar with the given parameters.
  ///
  /// The [searchProvider] parameter is required and must not be null.
  const YgStringSearchAppBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    super.focusNode,
    super.error,
    super.placeholder,
    super.onFocusChanged,
    super.onPressed,
    super.onEditingComplete,
    super.hint,
    super.inputFormatters,
    super.leading,
    super.trailing,
    super.completeAction,
    super.searchAction,
    super.automaticallyImplyLeading,
    this.controller,
    this.onChanged,
    this.initialValue,
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

  /// The initial value of the widget.
  ///
  /// This value is ignored if [controller] is provided.
  final String? initialValue;

  @override
  State<YgStringSearchAppBar> createState() => _YgStringSearchAppBarState();
}

class _YgStringSearchAppBarState extends _YgSearchAppBarState<String, String, YgStringSearchAppBar> {
  @override
  Widget _buildSearchBar(Widget? leading) {
    return YgStringSearchBar(
      keyboardType: widget.keyboardType,
      autocorrect: widget.autocorrect,
      textCapitalization: widget.textCapitalization,
      focusNode: widget.focusNode,
      error: widget.error,
      placeholder: widget.placeholder,
      onFocusChanged: widget.onFocusChanged,
      onPressed: widget.onPressed,
      controller: widget.controller,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      hint: widget.hint,
      inputFormatters: widget.inputFormatters,
      leading: leading,
      trailing: widget.trailing,
      completeAction: widget.completeAction,
      searchAction: widget.searchAction,
      searchProvider: widget.searchProvider,
      initialValue: widget.initialValue,
    );
  }
}
