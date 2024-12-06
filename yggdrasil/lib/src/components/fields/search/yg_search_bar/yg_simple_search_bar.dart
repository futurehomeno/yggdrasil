part of 'yg_search_bar.dart';

/// Internal implementation of the [YgSearchBar].
class _YgSimpleSearchBar<Value> extends YgSearchBar<Value> {
  const _YgSimpleSearchBar({
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
    this.initialValue,
    this.onChanged,
    this.controller,
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
  State<_YgSimpleSearchBar<Value>> createState() => _YgSimpleSearchBarWidgetState<Value>();
}

class _YgSimpleSearchBarWidgetState<Value> extends _YgSearchBarWidgetState<
    Value,
    Value,
    YgSearchResult<Value>,
    YgSearchResultsLayout<Value>,
    _YgSimpleSearchBar<Value>> with YgSimpleSearchStateMixin<Value, _YgSimpleSearchBar<Value>> {
  @override
  void onChanged() {
    widget.onChanged?.call(
      _controllerManager.value.value as Value?,
    );
  }

  @override
  YgSimpleSearchProvider<Value> get searchProvider => widget.searchProvider;

  @override
  YgSimpleSearchController<Value>? getUserController() => widget.controller;

  @override
  YgSimpleSearchController<Value> createController() => YgSimpleSearchController<Value>(
        initialValue: widget.initialValue,
      );
}
