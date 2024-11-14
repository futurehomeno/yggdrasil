part of 'yg_search_app_bar.dart';

class _YgValueSearchAppBar<T> extends YgSearchAppBar<T> {
  const _YgValueSearchAppBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    YgValueSearchController<T>? super.controller,
    this.initialValue,
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

  final YgValueSearchProvider<T> searchProvider;

  final T? initialValue;

  @override
  State<_YgValueSearchAppBar<T>> createState() => YgValueSearchAppBarState<T>();
}

class YgValueSearchAppBarState<T> extends YgSearchAppBarState<T, _YgValueSearchAppBar<T>> {
  @override
  Widget _buildSearchBar(Widget? leading) {
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
      searchProvider: widget.searchProvider,
      initialValue: widget.initialValue,
    );
  }
}
