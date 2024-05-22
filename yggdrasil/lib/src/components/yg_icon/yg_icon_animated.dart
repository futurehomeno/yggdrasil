part of 'yg_icon.dart';

class _YgIconAnimated extends YgIcon {
  const _YgIconAnimated(
    YgAnimatedIconData super.iconData, {
    super.key,
    super.semanticLabel,
    super.size,
    this.animated = true,
  }) : super._();

  /// Whether the icon animation should play.
  final bool animated;

  @override
  Widget build(BuildContext context) {
    return YgIconFrame(
      color: null,
      size: size,
      iconBuilder: (BuildContext context, Color color) {
        return AnimatedIcon(
          iconData: iconData as YgAnimatedIconData,
          animated: animated,
        );
      },
      semanticLabel: semanticLabel ?? iconData.name,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(FlagProperty('animated', value: animated, defaultValue: true));
    super.debugFillProperties(properties);
  }
}
