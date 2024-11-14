part of 'yg_search_app_bar.dart';

class YgStringSearchAppBar extends YgSearchAppBar<String> {
  const YgStringSearchAppBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
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
    super.completeAction,
    super.searchAction,
    super.automaticallyImplyLeading,
  }) : super._();

  final YgStringSearchProvider searchProvider;

  @override
  State<YgStringSearchAppBar> createState() => _YgStringSearchAppBarState();
}

class _YgStringSearchAppBarState extends _YgSearchAppBarState<String, YgStringSearchAppBar> {
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
      searchProvider: widget.searchProvider,
    );
  }
}
