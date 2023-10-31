import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

class YgAnimatedPhysicalModel extends StatelessWidget {
  const YgAnimatedPhysicalModel({
    super.key,
    this.shape = BoxShape.rectangle,
    this.clipBehavior = Clip.none,
    this.borderRadius,
    this.elevation,
    required this.color,
    this.shadowColor,
    this.child,
  });

  final Widget? child;
  final BoxShape shape;
  final Clip clipBehavior;
  final YgDrivenColorProperty color;
  final YgDrivenNullableBorderRadiusProperty? borderRadius;
  final YgDrivenNullableDoubleProperty? elevation;
  final YgDrivenNullableColorProperty? shadowColor;

  @override
  Widget build(BuildContext context) {
    return YgAnimatedBuilder(
      properties: <YgDynamicDrivenProperty?>{
        borderRadius,
        elevation,
        color,
        shadowColor,
      },
      builder: (BuildContext context) {
        return PhysicalModel(
          color: color.value,
          borderRadius: borderRadius?.value,
          elevation: elevation?.value ?? 0.0,
          shadowColor: shadowColor?.value ?? const Color(0xFF000000),
          shape: shape,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    );
  }
}
