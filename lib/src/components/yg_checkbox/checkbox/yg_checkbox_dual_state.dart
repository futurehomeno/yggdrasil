part of 'yg_checkbox.dart';

class YgCheckboxDualState extends YgCheckbox with YgDualStateToggleableMixin {
  const YgCheckboxDualState({
    super.key,
    required super.value,
    required this.onChanged,
    super.hasError,
  }) : super._();

  /// Callback to trigger when the value of the checkbox changes.
  ///
  /// The checkbox itself does not maintain any state. Instead, when the state of
  /// the checkbox changes, the widget calls the [onChanged] callback.
  @override
  final ValueChanged<bool>? onChanged;
}
