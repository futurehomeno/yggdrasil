part of 'yg_search_field.dart';

class _YgValueSearchField<T> extends YgSearchField<T> {
  const _YgValueSearchField({
    super.key,
    required super.label,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    YgValueSearchController<T>? super.controller,
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

  final YgSearchProvider<T> searchProvider;

  final T? initialValue;

  @override
  State<YgSearchField<T>> createState() => _YgValueSearchFieldState<T>();
}

class _YgValueSearchFieldState<T> extends YgSearchFieldWidgetState<T, _YgValueSearchField<T>, YgSearchResult<T>>
    with YgValueSearchMixin<T, _YgValueSearchField<T>> {
  @override
  YgSearchControllerAny<T> createController() {
    return YgValueSearchController<T>(
      initialValue: widget.initialValue,
    );
  }

  @override
  void onChanged() {
    final Object? value = _controllerManager.value.value;

    // This should never happen.
    assert(value is T);
    if (value is! T) {
      return;
    }

    widget.onChanged?.call(
      _controllerManager.value.value as T,
    );
  }

  @override
  YgSearchProvider<T> get searchProvider => widget.searchProvider;
}
