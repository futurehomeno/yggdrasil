part of '../../yg_list_tile.dart';

final class YgSwitchListTileTriState extends YgSwitchListTile with YgTriStateToggleableMixin {
  const YgSwitchListTileTriState({
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

  /// See [YgSwitch] documentation.
  @override
  YgSwitch _buildSwitch() {
    return YgSwitch.triState(
      onChanged: onChanged,
      value: value,
    );
  }
}
