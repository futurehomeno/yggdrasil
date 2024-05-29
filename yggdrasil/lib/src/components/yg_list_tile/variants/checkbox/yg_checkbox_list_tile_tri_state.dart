part of '../../yg_list_tile.dart';

final class _YgCheckboxListTileTriState extends YgCheckboxListTile with YgTriStateToggleableMixin {
  const _YgCheckboxListTileTriState({
    super.key,
    required super.value,
    required this.onChanged,
    super.title,
    super.leadingWidget,
    super.subtitle,
    super.subtitleIcon,
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

  /// See [YgCheckbox] documentation.
  @override
  final ValueChanged<bool?>? onChanged;

  @override
  YgCheckbox _buildCheckbox() {
    return YgCheckbox.triState(
      value: value,
      onChanged: onChanged,
    );
  }
}
