part of '../yg_search_field.dart';

// TODO(Tim): Move this to generic factory constructors once this has been
// implemented https://github.com/dart-lang/language/issues/647
/// The advanced search variation of the yggdrasil search field.
///
/// This version of the search field allows for the value of the search field to be
/// different from the value of the search results. This is useful in case the
/// search results lack important data needed for the final value of the widget,
/// which will be fetched separately.
///
/// If you want the value of the search field to be identical to the value of the
/// selected result, use the [YgSearchField] instead.
///
/// If you want to search for any string, use [YgStringSearchField] instead.
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
  final YgAdvancedSearchController<Value, ResultValue>? controller;

  /// The search provider for this widget.
  final YgAdvancedSearchProvider<Value, ResultValue> searchProvider;

  /// The initial value of the widget.
  ///
  /// This value is ignored if [controller] is provided.
  final YgSearchValueAndText<Value>? initialValue;

  /// Optional callback called whenever the value changes.
  final ValueChanged<Value?>? onChanged;

  @override
  State<YgSearchField<Value>> createState() => _YgAdvancedSearchFieldState<Value, ResultValue>();
}

class _YgAdvancedSearchFieldState<Value, ResultValue>
    extends
        YgSearchFieldWidgetState<
          Value,
          ResultValue,
          YgSearchResult<ResultValue>,
          YgSearchResultsLayout<ResultValue>,
          YgAdvancedSearchField<Value, ResultValue>
        >
    with YgAdvancedSearchStateMixin<Value, ResultValue, YgAdvancedSearchField<Value, ResultValue>> {
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
