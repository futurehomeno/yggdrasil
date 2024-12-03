part of 'yg_search_bar.dart';

class YgAdvancedSearchBar<Value, ResultValue> extends YgSearchBar<Value> {
  const YgAdvancedSearchBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    super.completeAction,
    super.error,
    super.focusNode,
    super.hint,
    super.initialQuery,
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

  final YgAdvancedSearchProvider<Value, ResultValue> searchProvider;

  final YgSearchValueAndText<Value>? initialValue;

  final ValueChanged<Value?>? onChanged;

  final YgAdvancedSearchController<Value, ResultValue>? controller;

  @override
  State<YgAdvancedSearchBar<Value, ResultValue>> createState() => _YgAdvancedSearchBarWidgetState<Value, ResultValue>();
}

class _YgAdvancedSearchBarWidgetState<Value, ResultValue> extends YgSearchBarWidgetState<Value, ResultValue,
        YgSearchResult<ResultValue>, YgSearchResultsLayout<ResultValue>, YgAdvancedSearchBar<Value, ResultValue>>
    with YgAdvancedSearchMixin<Value, ResultValue, YgAdvancedSearchBar<Value, ResultValue>> {
  @override
  void onChanged() {
    widget.onChanged?.call(
      _controllerManager.value.value as Value,
    );
  }

  @override
  YgAdvancedSearchProvider<Value, ResultValue> get searchProvider => widget.searchProvider;

  @override
  YgAdvancedSearchController<Value, ResultValue>? getUserController() => widget.controller;

  @override
  YgAdvancedSearchController<Value, ResultValue> createController() => YgAdvancedSearchController<Value, ResultValue>(
        initialValue: widget.initialValue,
      );
}
