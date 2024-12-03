part of 'yg_search_app_bar.dart';

class _YgSimpleSearchAppBar<Value> extends YgSearchAppBar<Value> {
  const _YgSimpleSearchAppBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    this.initialValue,
    super.focusNode,
    super.error,
    super.placeholder,
    super.onFocusChanged,
    super.onPressed,
    super.onEditingComplete,
    super.hint,
    super.inputFormatters,
    super.initialQuery,
    super.leading,
    super.trailing,
    super.completeAction,
    super.searchAction,
    super.automaticallyImplyLeading,
    this.controller,
    this.onChanged,
  }) : super._();

  final YgSimpleSearchProvider<Value> searchProvider;

  final Value? initialValue;

  final ValueChanged<Value?>? onChanged;

  final YgSimpleSearchController<Value>? controller;

  @override
  State<_YgSimpleSearchAppBar<Value>> createState() => _YgSimpleSearchAppBarState<Value>();
}

class _YgSimpleSearchAppBarState<Value> extends _YgSearchAppBarState<Value, Value, _YgSimpleSearchAppBar<Value>> {
  @override
  Widget _buildSearchBar(Widget? leading) {
    return YgSearchBar<Value>(
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
