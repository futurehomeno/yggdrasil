part of 'yg_switch_list_tile.dart';

final class _YgSwitchListTileDualState extends YgSwitchListTile with YgDualStateToggleableMixin {
  const _YgSwitchListTileDualState({
    super.key,
    required super.value,
    required this.onChanged,
    super.title,
    super.leadingWidget,
    super.subtitle,
    super.subtitleIcon,
    super.trailingWidget,
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

  /// See [YgSwitch] documentation.
  @override
  final ValueChanged<bool>? onChanged;

  @override
  YgSwitch _buildSwitch() {
    return YgSwitch(
      onChanged: onChanged,
      value: value,
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
