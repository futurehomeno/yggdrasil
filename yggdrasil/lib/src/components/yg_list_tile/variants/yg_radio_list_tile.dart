part of '../yg_list_tile.dart';

/// Radio button inside a list tile.
final class YgRadioListTile<T> extends YgListTile {
  const YgRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.title,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidget,
    super.density = YgListTileDensity.standard,
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
        super._(
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
    return YgListTileBody.withChildAndOptionalLeading(
      density: density,
      title: title.asText(),
      subtitle: subtitle.asText(),
      subtitleIcon: subtitleIcon,
      disabled: onChanged == null,
      onTap: _onTap,
      leading: leadingWidget,
      supporting: null,
      infoButton: null,
      builder: null,
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
