part of 'yg_list_tile.dart';

/// Radio button inside a list tile.
final class YgRadioListTile<T> extends YgListTile {
  const YgRadioListTile({
    super.key,
    required super.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidget,
  }) : super._(
          disabled: onChanged == null,
        );

  /// See [YgRadio.value].
  final T value;

  /// See [YgRadio.groupValue].
  final T? groupValue;

  /// See [YgRadio.onChanged].
  final ValueChanged<T?>? onChanged;

  /// Optional leading widget.
  ///
  /// When provided the [YgRadio] will be moved to the trailing position.
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return _YgListTileBody.withChildAndOptionalLeading(
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
          child: YgRadio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  void _onTap() {
    onChanged?.call(value);
  }
}
