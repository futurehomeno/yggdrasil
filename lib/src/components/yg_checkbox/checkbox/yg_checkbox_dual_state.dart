part of 'yg_checkbox.dart';

class YgCheckboxDualState extends YgCheckbox with YgDualStateToggleableMixin {
  const YgCheckboxDualState({
    super.key,
    required this.value,
    required this.onChanged,
    super.hasError,
  }) : super._();

  /// The current value of the checkbox.
  @override
  final bool value;

  /// Callback to trigger when the value of the checkbox changes.
  ///
  /// The checkbox itself does not maintain any state. Instead, when the state of
  /// the checkbox changes, the widget calls the [onChanged] callback.
  @override
  final ValueChanged<bool>? onChanged;
}
