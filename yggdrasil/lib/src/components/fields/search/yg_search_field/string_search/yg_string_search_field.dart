part of '../yg_search_field.dart';

// TODO(Tim): Move this to generic factory constructors once this has been
// implemented https://github.com/dart-lang/sdk/issues/30041
/// The string search variation of the yggdrasil search field.
///
/// This version of the search field guarantees the value of the search field is
/// identical to the search query entered by the user. This version of the
/// search field does not require the user to select a result in order to have a
/// value. Selecting a result however will set the current value and search
/// query to the title of the selected search result.
///
/// If you want to search for strings, but want to limit the accepted values to
/// only the result values, use [YgSearchField] with a type of string instead.
///
/// For advanced search implementation, use [YgAdvancedSearchField] instead.
class YgStringSearchField extends YgSearchField<String> {
  const YgStringSearchField({
    super.key,
    required super.label,
    required super.keyboardType,
    required super.autocorrect,
    required super.textCapitalization,
    required this.searchProvider,
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
    this.controller,
    this.onChanged,
  }) : super._();

  /// The search provider for this widget.
  final YgStringSearchProvider searchProvider;

  /// Optional controller to control this widget.
  ///
  /// When provided, overwrites the [initialValue] with the initial value passed
  /// to the controller.
  final YgStringSearchController? controller;

  /// Optional callback called whenever the value changes.
  final ValueChanged<String>? onChanged;

  /// The initial value of the widget.
  ///
  /// This value is ignored if [controller] is provided.
  final String? initialValue;

  @override
  State<YgStringSearchField> createState() => _YgStringSearchFieldState();
}

class _YgStringSearchFieldState extends YgSearchFieldWidgetState<String, String, YgStringSearchResult,
    YgStringSearchResultsLayout, YgStringSearchField> with YgStringSearchStateMixin<YgStringSearchField> {
  @override
  void onChanged() {
    widget.onChanged?.call(
      _controllerManager.value.textEditingController.text,
    );
  }

  @override
  YgStringSearchProvider get searchProvider => widget.searchProvider;

  @override
  YgStringSearchController? getUserController() => widget.controller;

  @override
  YgStringSearchController createController() => YgStringSearchController(
        initialValue: widget.initialValue,
      );
}
