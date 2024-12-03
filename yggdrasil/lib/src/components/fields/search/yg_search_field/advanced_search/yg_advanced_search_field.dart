part of '../yg_search_field.dart';

class YgAdvancedSearchField<Value, ResultValue> extends YgSearchField<Value> {
  const YgAdvancedSearchField({
    super.key,
    required super.label,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    this.controller,
    super.completeAction,
    super.disabled,
    super.error,
    super.focusNode,
    super.hint,
    super.inputFormatters,
    super.onEditingComplete,
    super.onFocusChanged,
    super.onPressed,
    super.placeholder,
    super.readOnly,
    super.searchAction,
    super.size,
    super.variant,
    this.initialValue,
    this.onChanged,
  }) : super._();

  final YgAdvancedSearchController<Value, ResultValue>? controller;

  final YgAdvancedSearchProvider<Value, ResultValue> searchProvider;

  final YgSearchValueAndText<Value>? initialValue;

  final ValueChanged<Value?>? onChanged;

  @override
  State<YgSearchField<Value>> createState() => _YgAdvancedSearchFieldState<Value, ResultValue>();
}

class _YgAdvancedSearchFieldState<Value, ResultValue> extends YgSearchFieldWidgetState<Value, ResultValue,
        YgSearchResult<ResultValue>, YgSearchResultsLayout<ResultValue>, YgAdvancedSearchField<Value, ResultValue>>
    with YgAdvancedSearchMixin<Value, ResultValue, YgAdvancedSearchField<Value, ResultValue>> {
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
