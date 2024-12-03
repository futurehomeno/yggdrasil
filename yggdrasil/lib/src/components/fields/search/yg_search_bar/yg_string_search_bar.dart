part of 'yg_search_bar.dart';

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

  final YgStringSearchProvider searchProvider;

  final YgStringSearchController? controller;

  final ValueChanged<String>? onChanged;

  final String? initialValue;

  @override
  State<YgStringSearchBar> createState() => _YgStringSearchBarState();
}

class _YgStringSearchBarState
    extends YgSearchBarWidgetState<String, String, YgStringSearchResult, YgStringSearchResultsLayout, YgStringSearchBar>
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
