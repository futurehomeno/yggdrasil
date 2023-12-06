part of 'yg_switch.dart';

final class YgSwitchDualState extends YgSwitch with YgDualStateToggleableMixin {
  const YgSwitchDualState({
    super.key,
    required this.value,
    required this.onChanged,
  }) : super._();

  /// The current value of the switch.
  @override
  final bool value;

  /// Callback to trigger when the value of the switch changes.
  ///
  /// The switch itself does not maintain any state. Instead, when the state of
  /// the switch changes, the widget calls the [onChanged] callback.
  @override
  final ValueChanged<bool>? onChanged;
}
