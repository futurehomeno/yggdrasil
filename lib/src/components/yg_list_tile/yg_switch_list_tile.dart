part of 'yg_list_tile.dart';

/// Binary (or optionally tri-state) switch.
final class YgSwitchListTile extends YgListTile {
  const YgSwitchListTile({
    super.key,
    required super.title,
    required this.value,
    required this.onChanged,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidget,
    this.trailingWidget,
    this.triState = false,
  }) : super._(
          disabled: onChanged == null,
        );

  /// See [YgSwitch] documentation.
  final bool? value;

  /// See [YgSwitch] documentation.
  final Function(bool? newValue)? onChanged;

  /// See [YgSwitch] documentation.
  final bool triState;

  /// Optional widget to display before the title.
  final Widget? leadingWidget;

  /// Optional widget to display before the switch.
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return _YgListTileBody(
      title: title,
      subtitle: subtitle,
      subtitleIcon: subtitleIcon,
      disabled: disabled,
      onTap: _onTap,
      leading: leadingWidget,
      trailing: Row(
        children: <Widget>[
          if (trailingWidget != null) trailingWidget!,
          AbsorbPointer(
            child: YgNoFocus(
              child: YgSwitch(
                value: value,
                onChanged: onChanged,
                triState: triState,
              ),
            ),
          ),
        ],
      ),
      supporting: null,
      infoButton: null,
    );
  }

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(value, triState);
    onChanged?.call(nextValue);
  }
}
