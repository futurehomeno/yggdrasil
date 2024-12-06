part of '../yg_search_field.dart';

/// Internal implementation of the [YgSearchField].
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

  /// Optional controller to control this widget.
  ///
  /// When provided, overwrites the [initialValue] with the initial value passed
  /// to the controller.
  final YgSimpleSearchController<Value>? controller;

  /// The search provider for this widget.
  final YgSimpleSearchProvider<Value> searchProvider;

  /// The initial value of the widget.
  ///
  /// This value is ignored if [controller] is provided.
  final Value? initialValue;

  /// Optional callback called whenever the value changes.
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
