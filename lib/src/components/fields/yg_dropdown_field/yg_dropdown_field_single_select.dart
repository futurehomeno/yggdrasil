part of 'yg_dropdown_field.dart';

class _YgDropdownFieldSingleSelect<T extends Object> extends YgDropdownField<T> {
  const _YgDropdownFieldSingleSelect({
    super.key,
    required List<YgDropdownEntry<T>> entries,
    required String label,
    YgDropdownFieldVariant variant = YgDropdownFieldVariant.standard,
    YgDropdownFieldSize size = YgDropdownFieldSize.large,
    FocusNode? focusNode,
    this.initialValue,
    String? error,
    int? minLines,
    String? placeholder,
    int maxLines = 1,
    bool disabled = false,
    bool allowDeselect = false,
    YgDropdownAction dropdownAction = YgDropdownAction.auto,
    ValueChanged<bool>? onFocusChanged,
    YgSingleSelectDropdownController<T>? controller,
    this.onChange,
  }) : super._(
          variant: variant,
          size: size,
          entries: entries,
          focusNode: focusNode,
          error: error,
          label: label,
          minLines: minLines,
          placeholder: placeholder,
          maxLines: maxLines,
          disabled: disabled,
          allowDeselect: allowDeselect,
          dropdownAction: dropdownAction,
          onFocusChanged: onFocusChanged,
          controller: controller,
        );

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
    return YgSingleSelectDropdownController(
      initialValue: widget.initialValue,
    );
  }
}
