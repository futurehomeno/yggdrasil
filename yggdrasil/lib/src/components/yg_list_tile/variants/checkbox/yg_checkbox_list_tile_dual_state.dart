part of 'yg_checkbox_list_tile.dart';

final class _YgCheckboxListTileDualState extends YgCheckboxListTile with YgDualStateToggleableMixin {
  const _YgCheckboxListTileDualState({
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
        super._();

  /// See [YgCheckbox] documentation.
  @override
  final ValueChanged<bool>? onChanged;

  @override
  YgCheckbox _buildCheckbox() {
    return YgCheckbox(
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  YgDebugType get debugType {
    if (onChanged == null) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}
