part of '../yg_dropdown_field.dart';

class _YgDropdownFieldMultiSelect<T extends Object> extends YgDropdownField<T> {
  const _YgDropdownFieldMultiSelect({
    super.key,
    required super.entries,
    required super.label,
    super.variant = YgFieldVariant.standard,
    super.size = YgFieldSize.large,
    super.completeAction = YgCompleteAction.unfocus,
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
    super.onEditingComplete,
    super.metric,
    YgMultiSelectDropdownController<T>? super.controller,
    this.initialValue,
    this.onChanged,
  }) : assert(
         dropdownAction != YgDropdownAction.picker,
         "Can not use 'YgDropdownAction.picker' in YgDropdownField.multiSelect",
       ),
       assert(
         dropdownAction != YgDropdownAction.autoPicker,
         "Can not use 'YgDropdownAction.pickerAuto' in YgDropdownField.multiSelect",
       ),
       super._();

  /// The initial value of the [YgDropdownField].
  final Set<T>? initialValue;

  /// Called with the new value when the value has changed.
  ///
  /// !-- WARNING --
  /// This value can be called multiple times while the dropdown is opened and
  /// is not an alternative to the [onEditingComplete] callback.
  final ValueChanged<Set<T>>? onChanged;

  @override
  _YgDropdownFieldMultiSelectState<T> createState() => _YgDropdownFieldMultiSelectState<T>();
}

class _YgDropdownFieldMultiSelectState<T extends Object>
    extends YgDropdownFieldWidgetState<T, _YgDropdownFieldMultiSelect<T>> {
  @override
  YgMultiSelectDropdownController<T> createController() {
    return YgMultiSelectDropdownController<T>(
      initialValue: widget.initialValue,
    );
  }
}
