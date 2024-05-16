part of 'yg_icon.dart';

class YgIconColorable extends YgIcon {
  const YgIconColorable(
    YgColorableIconData super.iconData, {
    super.key,
    super.semanticLabel,
    super.size,
    required this.color,
  }) : super._();

  /// The color to use when drawing the icon.
  ///
  /// If no size is specified, the nearest IconTheme of the current
  /// context will be used. This is useful when a parent widget wants to
  /// specify a color for the icon.
  ///
  /// Note that [YgIconData]s will never be colored regardless of
  /// the parent widget specifying an [IconTheme].
  final Color color;

  @override
  Widget build(BuildContext context) {
    return YgIconFrame(
      color: color,
      size: size,
      iconBuilder: (BuildContext context, Color color) {
        return _buildColorableIcon(
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
