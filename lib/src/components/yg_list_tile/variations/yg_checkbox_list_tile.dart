part of '../yg_list_tile.dart';

/// Binary (or optionally tri-state) switch.
final class YgCheckboxListTile extends YgListTile {
  const YgCheckboxListTile({
    super.key,
    required super.title,
    required this.value,
    required this.onChanged,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidget,
    this.triState = false,
  }) : super._(
          disabled: onChanged == null,
        );

  /// See [YgCheckbox] documentation.
  final bool? value;

  /// See [YgCheckbox] documentation.
  final ValueChanged<bool?>? onChanged;

  /// See [YgCheckbox] documentation.
  final bool triState;

  /// Optional leading widget.
  ///
  /// When provided the [YgCheckbox] will be moved to the trailing position.
  final Widget? leadingWidget;

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(value, triState);
    onChanged?.call(nextValue);
  }

  @override
  Widget build(BuildContext context) {
    return YgListTileBody.withChildAndOptionalLeading(
      title: title,
      subtitle: subtitle,
      subtitleIcon: subtitleIcon,
      disabled: onChanged == null,
      onTap: _onTap,
      leading: leadingWidget,
      supporting: null,
      infoButton: null,
      child: AbsorbPointer(
        child: YgNoFocus(
          child: YgCheckbox(
            value: value,
            onChanged: onChanged,
            triState: triState,
          ),
        ),
      ),
    );
  }
}
