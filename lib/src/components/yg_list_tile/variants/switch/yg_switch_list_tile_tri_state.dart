part of '../../yg_list_tile.dart';

final class _YgSwitchListTileTriState extends YgSwitchListTile with YgTriStateToggleableMixin {
  const _YgSwitchListTileTriState({
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
  final bool? value;

  /// See [YgSwitch] documentation.
  @override
  final ValueChanged<bool?>? onChanged;

  @override
  YgSwitch _buildSwitch() {
    return YgSwitch.triState(
      onChanged: onChanged,
      value: value,
    );
  }
}
