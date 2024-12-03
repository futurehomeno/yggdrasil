part of '../yg_search_field.dart';

// TODO(Tim): Move this to generic factory constructors once this has been
// implemented https://github.com/dart-lang/sdk/issues/30041
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
    this.controller,
    this.onChanged,
  }) : super._();

  final YgStringSearchProvider searchProvider;

  final YgStringSearchController? controller;

  final ValueChanged<String>? onChanged;

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
