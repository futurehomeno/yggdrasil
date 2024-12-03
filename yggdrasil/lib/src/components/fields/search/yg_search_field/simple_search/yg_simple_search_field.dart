part of '../yg_search_field.dart';

class _YgSimpleSearchField<Value> extends YgSearchField<Value> {
  const _YgSimpleSearchField({
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

  final YgSimpleSearchController<Value>? controller;

  final YgSimpleSearchProvider<Value> searchProvider;

  final Value? initialValue;

  final ValueChanged<Value?>? onChanged;

  @override
  State<YgSearchField<Value>> createState() => _YgSimpleSearchFieldState<Value>();
}

class _YgSimpleSearchFieldState<Value> extends YgSearchFieldWidgetState<
    Value,
    Value,
    YgSearchResult<Value>,
    YgSearchResultsLayout<Value>,
    _YgSimpleSearchField<Value>> with YgSimpleSearchStateMixin<Value, _YgSimpleSearchField<Value>> {
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
