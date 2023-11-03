import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Build a [PhysicalModel] with animated properties.
class YgAnimatedPhysicalModel extends StatelessWidget {
  const YgAnimatedPhysicalModel({
    super.key,
    required this.color,
    this.shape = BoxShape.rectangle,
    this.clipBehavior = Clip.none,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.child,
  });

  /// See [PhysicalModel.child].
  final Widget? child;

  /// See [PhysicalModel.shape].
  final BoxShape shape;

  /// See [PhysicalModel.clipBehavior].
  final Clip clipBehavior;

  /// See [PhysicalModel.color].
  final YgDrivenColorProperty color;

  /// See [PhysicalModel.borderRadius].
  final YgDrivenNullableBorderRadiusProperty? borderRadius;

  /// See [PhysicalModel.elevation].
  final YgDrivenNullableDoubleProperty? elevation;

  /// See [PhysicalModel.shadowColor].
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
      builder: (BuildContext context, _) {
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
