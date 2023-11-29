part of '../../yg_list_tile.dart';

/// Binary (or optionally tri-state) switch.
abstract base class YgCheckboxListTile extends YgListTile implements YgToggleable {
  const factory YgCheckboxListTile({
    required bool value,
    required String title,
    required ValueChanged<bool>? onChanged,
    Key? key,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
  }) = YgCheckboxListTileDualState;

  const factory YgCheckboxListTile.triState({
    required bool? value,
    required String title,
    required ValueChanged<bool?>? onChanged,
    Key? key,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
  }) = YgCheckboxListTileTriState;

  const YgCheckboxListTile._({
    super.key,
    required super.title,
    required super.disabled,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidget,
  }) : super._();

  /// Optional leading widget.
  ///
  /// When provided the [YgCheckbox] will be moved to the trailing position.
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return YgListTileBody.withChildAndOptionalLeading(
      title: title,
      subtitle: subtitle,
      subtitleIcon: subtitleIcon,
      disabled: disabled,
      onTap: toggle,
      leading: leadingWidget,
      supporting: null,
      infoButton: null,
      child: AbsorbPointer(
        child: YgNoFocus(
          child: _buildCheckbox(),
        ),
      ),
    );
  }

  YgCheckbox _buildCheckbox();
}
