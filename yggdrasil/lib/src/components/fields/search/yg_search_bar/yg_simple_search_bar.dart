part of 'yg_search_bar.dart';

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

  final YgSimpleSearchProvider<Value> searchProvider;

  final Value? initialValue;

  final ValueChanged<Value?>? onChanged;

  final YgSimpleSearchController<Value>? controller;

  @override
  State<_YgSimpleSearchBar<Value>> createState() => _YgSimpleSearchBarWidgetState<Value>();
}

class _YgSimpleSearchBarWidgetState<Value> extends YgSearchBarWidgetState<
    Value,
    Value,
    YgSearchResult<Value>,
    YgSearchResultsLayout<Value>,
    _YgSimpleSearchBar<Value>> with YgSimpleSearchMixin<Value, _YgSimpleSearchBar<Value>> {
  @override
  void onChanged() {
    widget.onChanged?.call(
      _controllerManager.value.value as Value,
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
