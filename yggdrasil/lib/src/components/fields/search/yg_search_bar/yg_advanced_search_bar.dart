part of 'yg_search_bar.dart';

// TODO(Tim): Move this to generic factory constructors once this has been
// implemented https://github.com/dart-lang/language/issues/647
/// The advanced search variation of the yggdrasil search bar.
///
/// This version of the search bar allows for the value of the search bar to be
/// different from the value of the search results. This is useful in case the
/// search results lack important data needed for the final value of the widget,
/// which will be fetched separately.
///
/// If you want the value of the search bar to be identical to the value of the
/// selected result, use the [YgSearchBar] instead.
///
/// If you want to search for any string, use [YgStringSearchBar] instead.
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
  State<YgAdvancedSearchBar<Value, ResultValue>> createState() => _YgAdvancedSearchBarWidgetState<Value, ResultValue>();
}

class _YgAdvancedSearchBarWidgetState<Value, ResultValue>
    extends
        _YgSearchBarWidgetState<
          Value,
          ResultValue,
          YgSearchResult<ResultValue>,
          YgSearchResultsLayout<ResultValue>,
          YgAdvancedSearchBar<Value, ResultValue>
        >
    with YgAdvancedSearchStateMixin<Value, ResultValue, YgAdvancedSearchBar<Value, ResultValue>> {
  @override
  void onChanged() {
    widget.onChanged?.call(
      _controllerManager.value.value as Value?,
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
