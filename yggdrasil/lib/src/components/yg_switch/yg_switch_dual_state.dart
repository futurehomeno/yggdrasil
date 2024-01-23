part of 'yg_switch.dart';

final class YgSwitchDualState extends YgSwitch with YgDualStateToggleableMixin {
  const YgSwitchDualState({
    super.key,
    required super.value,
    required this.onChanged,
  }) : super._();

  /// Callback to trigger when the value of the switch changes.
  ///
  /// The switch itself does not maintain any state. Instead, when the state of
  /// the switch changes, the widget calls the [onChanged] callback.
  @override
  final ValueChanged<bool>? onChanged;
}
