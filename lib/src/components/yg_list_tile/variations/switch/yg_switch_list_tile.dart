part of '../../yg_list_tile.dart';

/// Binary (or optionally tri-state) switch.
abstract base class YgSwitchListTile extends YgListTile implements YgToggleable {
  const factory YgSwitchListTile({
    Key? key,
    required bool value,
    required String title,
    required ValueChanged<bool>? onChanged,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
    Widget? trailingWidget,
  }) = YgSwitchListTileDualState;

  /// Supports a nullable value "indeterminate".
  const factory YgSwitchListTile.triState({
    Key? key,
    required bool? value,
    required String title,
    required ValueChanged<bool?>? onChanged,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
    Widget? trailingWidget,
  }) = YgSwitchListTileTriState;

  const YgSwitchListTile._({
    super.key,
    required super.title,
    required super.disabled,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidget,
    this.trailingWidget,
  }) : super._();

  /// Optional widget to display before the title.
  final Widget? leadingWidget;

  /// Optional widget to display before the switch.
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return YgListTileBody(
      title: title,
      subtitle: subtitle,
      subtitleIcon: subtitleIcon,
      disabled: disabled,
      onTap: toggle,
      leading: leadingWidget,
      trailing: Row(
        children: <Widget>[
          if (trailingWidget != null) trailingWidget!,
          AbsorbPointer(
            child: YgNoFocus(
              child: _buildSwitch(),
            ),
          ),
        ],
      ),
      supporting: null,
      infoButton: null,
    );
  }

  YgSwitch _buildSwitch();
}
