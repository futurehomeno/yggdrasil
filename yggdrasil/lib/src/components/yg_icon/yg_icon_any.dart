part of 'yg_icon.dart';

class _YgIconAny extends YgIcon {
  const _YgIconAny(
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
          YgAnimatedIconData() => AnimatedIcon(
            iconData: iconData,
            animated: true,
          ),
          YgColorableIconData() => ColorableIcon(
            iconData: iconData,
            color: color,
          ),
          _ => ColorfulIcon(
            color: color,
            iconData: iconData,
          ),
        };
      },
      semanticLabel: semanticLabel ?? iconData.name,
    );
  }
}
