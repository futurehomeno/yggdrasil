part of '../yg_dropdown_field.dart';

class _YgDropdownFieldSingleSelect<T extends Object> extends YgDropdownField<T> {
  const _YgDropdownFieldSingleSelect({
    super.key,
    required super.entries,
    required super.label,
    super.variant = YgDropdownFieldVariant.standard,
    super.size = YgDropdownFieldSize.large,
    super.focusNode,
    super.error,
    super.minLines,
    super.placeholder,
    super.maxLines = 1,
    super.disabled = false,
    super.allowDeselect = false,
    super.dropdownAction = YgDropdownAction.auto,
    super.onFocusChanged,
    super.onPressed,
    YgSingleSelectDropdownController<T>? super.controller,
    this.initialValue,
    this.onChange,
  }) : super._();

  /// The initial value of the dropdown field.
  final T? initialValue;

  /// Called with the new value when the value has changed.
  final ValueChanged<T?>? onChange;

  @override
  _YgDropdownFieldSingleSelectState<T> createState() => _YgDropdownFieldSingleSelectState<T>();
}

class _YgDropdownFieldSingleSelectState<T extends Object>
    extends YgDropdownFieldState<T, _YgDropdownFieldSingleSelect<T>> {
  @override
  YgDynamicDropdownController<T> createController() {
    return YgSingleSelectDropdownController<T>(
      initialValue: widget.initialValue,
    );
  }
}
