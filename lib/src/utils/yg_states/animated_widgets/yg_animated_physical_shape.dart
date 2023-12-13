import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Builds a [PhysicalShape] with animated properties.
class YgAnimatedPhysicalShape extends StatelessWidget {
  const YgAnimatedPhysicalShape({
    super.key,
    this.child,
    required this.shape,
    this.clipBehavior = Clip.none,
    required this.color,
    this.elevation,
    this.shadowColor,
    this.borderOnForeground = true,
  });

  /// See [PhysicalShape.child].
  final Widget? child;

  /// See [PhysicalShape.clipBehavior].
  final Clip clipBehavior;

  /// See [YgAnimatedShapeBorderPainter.shape].
  final YgDrivenNullableShapeBorderProperty shape;

  /// See [PhysicalShape.color].
  final YgDrivenColorProperty color;

  /// See [PhysicalShape.elevation].
  final YgDrivenNullableDoubleProperty? elevation;

  /// See [PhysicalShape.shadowColor].
  final YgDrivenNullableColorProperty? shadowColor;

  /// See [YgAnimatedShapeBorderPainter.paintOnForeground]
  final bool borderOnForeground;

  @override
  Widget build(BuildContext context) {
    return YgAnimatedBuilder(
      properties: <YgDynamicDrivenProperty?>{
        shape,
        color,
        elevation,
        shadowColor,
      },
      builder: (BuildContext context, Widget? child) {
        final ShapeBorder? shape = this.shape.value;

        final Color color = this.color.value;
        final Clip clipBehavior = this.clipBehavior;
        final double elevation = this.elevation?.value ?? 0.0;
        final Color shadowColor = this.shadowColor?.value ?? const Color(0xFF000000);

        if (shape == null) {
          return PhysicalModel(
            color: color,
            clipBehavior: clipBehavior,
            elevation: elevation,
            shadowColor: shadowColor,
            child: child,
          );
        }

        return PhysicalShape(
          clipper: ShapeBorderClipper(shape: shape),
          color: color,
          clipBehavior: clipBehavior,
          elevation: elevation,
          shadowColor: shadowColor,
          child: child,
        );
      },
      child: YgAnimatedShapeBorderPainter(
        shape: shape,
        paintOnForeground: borderOnForeground,
        child: child,
      ),
    );
  }
}
