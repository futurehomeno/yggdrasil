part of 'yg_search_app_bar.dart';

/// Internal implementation of the [YgSearchAppBar].
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
    super.leading,
    super.trailing,
    super.completeAction,
    super.searchAction,
    super.automaticallyImplyLeading,
    this.controller,
    this.onChanged,
  }) : super._();

  /// The search provider for this widget.
  final YgSimpleSearchProvider<Value> searchProvider;

  /// The initial value of the widget.
  ///
  /// This value is ignored if [controller] is provided.
  final Value? initialValue;

  /// Optional callback called whenever the value changes.
  final ValueChanged<Value?>? onChanged;

  /// Optional controller to control this widget.
  ///
  /// When provided, overwrites the [initialValue] with the initial value passed
  /// to the controller.
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
      leading: leading,
      trailing: widget.trailing,
      completeAction: widget.completeAction,
      searchAction: widget.searchAction,
      searchProvider: widget.searchProvider,
      initialValue: widget.initialValue,
    );
  }
}
