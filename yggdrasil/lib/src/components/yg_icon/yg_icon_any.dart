part of 'yg_icon.dart';

class YgIconAny extends YgIcon {
  const YgIconAny(
    super.iconData, {
    super.key,
    super.size,
    super.semanticLabel,
  }) : super._();

  @override
  Widget build(BuildContext context) {
    final YgIconSize? size = this.size;
    final YgIconData iconData = this.iconData;

    return YgIconFrame(
      color: null,
      size: size,
      iconBuilder: (BuildContext context, Color color) {
        return switch (iconData) {
          YgAnimatedIconData() => _buildAnimatedIcon(
              iconData: iconData,
              animated: true,
            ),
          YgColorableIconData() => _buildColorableIcon(
              iconData: iconData,
              color: color,
            ),
          _ => _buildColorfulIcon(
              color: color,
              context: context,
              iconData: iconData,
            ),
        };
      },
      semanticLabel: semanticLabel ?? iconData.name,
    );
  }
}
