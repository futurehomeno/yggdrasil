part of 'yg_dropdown_field.dart';

class _YgDropdownFieldMultiSelect<T extends Object> extends YgDropdownField<T> {
  const _YgDropdownFieldMultiSelect({
    super.key,
    required super.entries,
    required super.label,
    super.variant = YgDropdownFieldVariant.standard,
    super.size = YgDropdownFieldSize.large,
    super.focusNode,
    super.error,
    super.minLines,
    super.placeholder,
    super.maxLines,
    super.disabled = false,
    super.allowDeselect = false,
    super.dropdownAction = YgDropdownAction.auto,
    super.onFocusChanged,
    super.onPressed,
    YgMultiSelectDropdownController<T>? super.controller,
    this.initialValue,
    this.onChange,
  }) : super._();

  /// The initial value of the dropdown field.
  final Set<T>? initialValue;

  /// Called with the new value when the value has changed.
  final ValueChanged<Set<T>>? onChange;

  @override
  _YgDropdownFieldMultiSelectState<T> createState() => _YgDropdownFieldMultiSelectState<T>();
}

class _YgDropdownFieldMultiSelectState<T extends Object>
    extends YgDropdownFieldState<T, _YgDropdownFieldMultiSelect<T>> {
  @override
  YgDynamicDropdownController<T> createController() {
    return YgMultiSelectDropdownController(
      initialValue: widget.initialValue,
    );
  }
}
