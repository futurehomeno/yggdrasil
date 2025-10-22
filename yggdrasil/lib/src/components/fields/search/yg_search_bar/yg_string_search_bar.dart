part of 'yg_search_bar.dart';

// TODO(Tim): Move this to generic factory constructors once this has been
// implemented https://github.com/dart-lang/language/issues/647
/// The string search variation of the yggdrasil search bar.
///
/// This version of the search bar guarantees the value of the search bar is
/// identical to the search query entered by the user. This version of the
/// search bar does not require the user to select a result in order to have a
/// value. Selecting a result however will set the current value and search
/// query to the title of the selected search result.
///
/// If you want to search for strings, but want to limit the accepted values to
/// only the result values, use [YgSearchBar] with a type of string instead.
///
/// For advanced search implementation, use [YgAdvancedSearchBar] instead.
class YgStringSearchBar extends YgSearchBar<String> {
  const YgStringSearchBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    super.completeAction,
    super.error,
    super.focusNode,
    super.hint,
    super.inputFormatters,
    super.leading,
    super.onEditingComplete,
    super.onFocusChanged,
    super.onPressed,
    super.placeholder,
    super.searchAction,
    super.trailing,
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
  State<YgStringSearchBar> createState() => _YgStringSearchBarState();
}

class _YgStringSearchBarState
    extends
        _YgSearchBarWidgetState<String, String, YgStringSearchResult, YgStringSearchResultsLayout, YgStringSearchBar>
    with YgStringSearchStateMixin<YgStringSearchBar> {
  @override
  void onChanged() {
    widget.onChanged?.call(
      _controllerManager.value.textEditingController.text,
    );
  }

  @override
  YgStringSearchProvider get searchProvider => widget.searchProvider;

  @override
  YgStringSearchController? getUserController() => widget.controller;

  @override
  YgStringSearchController createController() => YgStringSearchController(
    initialValue: widget.initialValue,
  );
}
