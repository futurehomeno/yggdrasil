part of '../yg_search_field.dart';

class _YgValueSearchField<Value, Result> extends YgSearchField<Value, Result> {
  const _YgValueSearchField({
    super.key,
    required super.label,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    this.controller,
    super.onChanged,
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
  }) : super._();

  final YgAdvancedSearchController<Value, Result>? controller;

  final YgSearchProvider<Value, Result> searchProvider;

  final Value? initialValue;

  @override
  State<YgSearchField<Value>> createState() => _YgValueSearchFieldState<Value>();
}

class _YgValueSearchFieldState<Value, Result>
    extends YgSearchFieldWidgetState<Value, Result, _YgValueSearchField<Value, Result>, YgSearchResult<Value>>
    with YgAdvancedValueSearchMixin<Value, Result, _YgValueSearchField<Value, Result>> {
  @override
  YgAdvancedSearchController<Value, Result> createController() {
    return YgAdvancedSearchController<Value, Result>(
      initialValue: widget.initialValue,
    );
  }

  @override
  void onChanged() {
    final Object? value = _controllerManager.value.value;

    // This should never happen.
    assert(value is Value);
    if (value is! Value) {
      return;
    }

    widget.onChanged?.call(
      _controllerManager.value.value as Value,
    );
  }

  @override
  YgSearchProvider<Value, Result> get searchProvider => widget.searchProvider;

  @override
  YgSearchControllerAny<Value>? get userController => widget.controller;
}
