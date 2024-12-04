part of 'yg_search_app_bar.dart';

/// The advanced
class YgAdvancedSearchAppBar<Value, ResultValue> extends YgSearchAppBar<Value> {
  const YgAdvancedSearchAppBar({
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

  final YgAdvancedSearchProvider<Value, ResultValue> searchProvider;

  final YgSearchValueAndText<Value>? initialValue;

  final ValueChanged<Value?>? onChanged;

  final YgAdvancedSearchController<Value, ResultValue>? controller;

  @override
  State<YgAdvancedSearchAppBar<Value, ResultValue>> createState() => _YgAdvancedSearchAppBarState<Value, ResultValue>();
}

class _YgAdvancedSearchAppBarState<Value, ResultValue>
    extends _YgSearchAppBarState<Value, ResultValue, YgAdvancedSearchAppBar<Value, ResultValue>> {
  @override
  Widget _buildSearchBar(Widget? leading) {
    return YgAdvancedSearchBar<Value, ResultValue>(
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
