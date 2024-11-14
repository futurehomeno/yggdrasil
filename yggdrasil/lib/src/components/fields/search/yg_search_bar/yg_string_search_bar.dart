part of 'yg_search_bar.dart';

class YgStringSearchBar extends YgSearchBar<String> {
  const YgStringSearchBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    YgStringSearchController? super.controller,
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
    super.trailing,
  }) : super._();

  final YgStringSearchProvider searchProvider;

  @override
  State<YgStringSearchBar> createState() => _YgStringSearchBarState();
}

class _YgStringSearchBarState extends YgSearchBarWidgetState<String, YgStringSearchBar>
    with YgStringSearchMixin<YgStringSearchBar> {
  @override
  YgSearchControllerAny<String> createController() {
    return YgStringSearchController(
      initialValue: widget.initialQuery,
    );
  }

  @override
  void onChanged() {
    widget.onChanged?.call(
      _controllerManager.value.textEditingController.text,
    );
  }

  @override
  YgStringSearchProvider get searchProvider => widget.searchProvider;
}
