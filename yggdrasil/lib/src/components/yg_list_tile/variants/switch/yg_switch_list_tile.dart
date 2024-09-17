part of '../../yg_list_tile.dart';

/// Binary (or optionally tri-state) switch.
abstract base class YgSwitchListTile extends YgListTile implements YgToggleable {
  const factory YgSwitchListTile({
    Key? key,
    required bool? value,
    required ValueChanged<bool>? onChanged,
    String? title,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
    Widget? trailingWidget,
    YgListTileDensity density,
  }) = _YgSwitchListTileDualState;

  /// Supports a nullable value, i.e. "indeterminate".
  const factory YgSwitchListTile.triState({
    Key? key,
    required bool? value,
    required ValueChanged<bool?>? onChanged,
    String? title,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
    Widget? trailingWidget,
    YgListTileDensity density,
  }) = _YgSwitchListTileTriState;

  const YgSwitchListTile._({
    super.key,
    required super.disabled,
    required super.title,
    required super.subtitle,
    required super.subtitleIcon,
    required super.density,
    required this.leadingWidget,
    required this.trailingWidget,
    required this.value,
  }) : super._();

  /// See [YgSwitch] documentation.
  @override
  final bool? value;

  /// Optional widget to display before the title.
  final Widget? leadingWidget;

  /// Optional widget to display before the switch.
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return YgListTileBody(
      builder: null,
      density: density,
      title: title.asText(),
      subtitle: subtitle.asText(),
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
