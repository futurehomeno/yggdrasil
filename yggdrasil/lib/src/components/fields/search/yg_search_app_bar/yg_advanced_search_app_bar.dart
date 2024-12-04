part of 'yg_search_app_bar.dart';

/// The advanced search variation of the yggdrasil search app bar.
///
/// This version of the search app bar allows for the value of the search bar to be
/// different from the value of the search results. This is useful in case the
/// search results lack important data needed for the final value of the widget,
/// which will be fetched separately.
///
/// If you want the value of the search app bar to be identical to the value of the
/// selected result, use the [YgSearchAppBar] instead.
///
/// If you want to search for any string, use [YgStringSearchAppBar] instead.
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

  /// The search provider for this widget.
  final YgAdvancedSearchProvider<Value, ResultValue> searchProvider;

  /// The initial value of the widget.
  ///
  /// This value is ignored if [controller] is provided.
  final YgSearchValueAndText<Value>? initialValue;

  /// Optional callback called whenever the value changes.
  final ValueChanged<Value?>? onChanged;

  /// Optional controller to control this widget.
  ///
  /// When provided, overwrites the [initialValue] with the initial value passed
  /// to the controller.
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
