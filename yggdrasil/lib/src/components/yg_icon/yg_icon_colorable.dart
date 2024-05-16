part of 'yg_icon.dart';

class _YgIconColorable extends YgIcon {
  const _YgIconColorable(
    YgColorableIconData super.iconData, {
    super.key,
    super.semanticLabel,
    super.size,
    required this.color,
  }) : super._();

  /// The color used when drawing the icon.
  ///
  /// If no color is specified, the nearest IconTheme of the current context
  /// will be used. This is useful when a parent widget wants to
  /// specify a color for the icon.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return YgIconFrame(
      color: color,
      size: size,
      iconBuilder: (BuildContext context, Color color) {
        return ColorableIcon(
          iconData: iconData as YgColorableIconData,
          color: color,
        );
      },
      semanticLabel: semanticLabel ?? iconData.name,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(ColorProperty('color', color, defaultValue: null));
    super.debugFillProperties(properties);
  }
}
