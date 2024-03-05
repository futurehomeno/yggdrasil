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
  }) = _YgSwitchListTileTriState;

  const YgSwitchListTile._({
    super.key,
    required super.disabled,
    super.title,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidget,
    this.trailingWidget,
    this.value,
  })  : assert(
          title != null || leadingWidget != null,
          'Can not have neither a title or leading widget.',
        ),
        assert(
          subtitleIcon == null || subtitle != null,
          'Can not add a subtitleIcon without a subtitle.',
        ),
        assert(
          title != null || subtitle == null,
          'Can not have a subtitle without a title.',
        ),
        super._();

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
