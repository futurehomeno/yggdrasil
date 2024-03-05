part of '../../yg_list_tile.dart';

/// Binary (or optionally tri-state) checkbox.
abstract base class YgCheckboxListTile extends YgListTile implements YgToggleable {
  const factory YgCheckboxListTile({
    required bool? value,
    required ValueChanged<bool>? onChanged,
    String? title,
    Key? key,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
  }) = _YgCheckboxListTileDualState;

  /// Supports a nullable value, i.e. "indeterminate".
  const factory YgCheckboxListTile.triState({
    required bool? value,
    required ValueChanged<bool?>? onChanged,
    String? title,
    Key? key,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
  }) = _YgCheckboxListTileTriState;

  const YgCheckboxListTile._({
    super.key,
    required super.disabled,
    super.title,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidget,
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

  /// See [YgCheckbox] documentation.
  @override
  final bool? value;

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
