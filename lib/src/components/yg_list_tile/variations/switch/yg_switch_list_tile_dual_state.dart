part of '../../yg_list_tile.dart';

final class YgSwitchListTileDualState extends YgSwitchListTile with YgDualStateToggleableMixin {
  const YgSwitchListTileDualState({
    super.key,
    required super.title,
    required this.value,
    required this.onChanged,
    super.leadingWidget,
    super.subtitle,
    super.subtitleIcon,
    super.trailingWidget,
  }) : super._(
          disabled: onChanged == null,
        );

  /// See [YgSwitch] documentation.
  @override
  final bool value;

  /// See [YgSwitch] documentation.
  @override
  final ValueChanged<bool>? onChanged;

  @override
  YgSwitch _buildSwitch() {
    return YgSwitch(
      onChanged: onChanged,
      value: value,
    );
  }
}
