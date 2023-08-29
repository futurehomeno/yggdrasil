part of 'yg_dropdown_field.dart';

class _YgDropdownFieldMultiSelect<T extends Object> extends YgDropdownField<T> {
  const _YgDropdownFieldMultiSelect({
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
    int? maxLines,
    bool disabled = false,
    bool allowDeselect = false,
    YgDropdownAction dropdownAction = YgDropdownAction.auto,
    ValueChanged<bool>? onFocusChanged,
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
        );

  final Set<T>? initialValue;
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
