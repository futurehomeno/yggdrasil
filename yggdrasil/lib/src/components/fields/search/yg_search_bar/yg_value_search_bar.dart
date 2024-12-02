part of 'yg_search_bar.dart';

class _YgValueSearchBar<T> extends YgSearchBar<T> {
  const _YgValueSearchBar({
    super.key,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
    YgAdvancedSearchController<T>? super.controller,
    super.completeAction,
    super.error,
    super.focusNode,
    super.hint,
    super.initialQuery,
    super.inputFormatters,
    super.leading,
    super.onChanged,
    super.onEditingComplete,
    super.onFocusChanged,
    super.onPressed,
    super.placeholder,
    super.searchAction,
    super.trailing,
    this.initialValue,
  }) : super._();

  final YgAdvancedSearchProvider<T> searchProvider;

  final T? initialValue;

  @override
  State<_YgValueSearchBar<T>> createState() => _YgValueSearchBarWidgetState<T>();
}

class _YgValueSearchBarWidgetState<T> extends YgSearchBarWidgetState<T, _YgValueSearchBar<T>, YgSearchResult<T>>
    with YgAdvancedSearchMixin<T, _YgValueSearchBar<T>> {
  @override
  YgSearchControllerAny<T> createController() {
    return YgAdvancedSearchController<T>(
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
  YgAdvancedSearchProvider<T> get searchProvider => widget.searchProvider;
}
