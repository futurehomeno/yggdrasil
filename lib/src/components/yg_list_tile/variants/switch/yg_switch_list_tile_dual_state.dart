part of '../../yg_list_tile.dart';

final class _YgSwitchListTileDualState extends YgSwitchListTile with YgDualStateToggleableMixin {
  const _YgSwitchListTileDualState({
    super.key,
    required super.title,
    required super.value,
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
  final ValueChanged<bool>? onChanged;

  @override
  YgSwitch _buildSwitch() {
    return YgSwitch(
      onChanged: onChanged,
      value: value,
    );
  }
}
