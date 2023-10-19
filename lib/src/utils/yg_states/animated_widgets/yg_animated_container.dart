import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/src/utils/yg_states/extensions/yg_driven_color_property_extension.dart';

class YgAnimatedContainer extends StatelessWidget {
  YgAnimatedContainer({
    super.key,
    this.child,
    this.alignment,
    this.padding,
    this.foregroundDecoration,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    YgDrivenDecorationProperty? decoration,
    YgDrivenColorProperty? color,
    this.clipBehavior = Clip.none,
    this.width,
    this.height,
  })  : assert(
          color == null || decoration == null,
          'Cannot provide both a color and a decoration\n'
          'The color argument is just a shorthand for "decoration: BoxDecoration(color: color)".',
        ),
        decoration = decoration ?? color?.toDecoration();

  final YgDrivenNullableDoubleProperty? width;
  final YgDrivenNullableDoubleProperty? height;
  final Widget? child;
  final YgDrivenNullableAlignmentGeometryProperty? alignment;
  final YgDrivenNullableEdgeInsetsGeometryProperty? padding;
  final YgDrivenNullableDecorationProperty? decoration;
  final YgDrivenNullableDecorationProperty? foregroundDecoration;
  final YgDrivenNullableBoxConstraintsProperty? constraints;
  final YgDrivenNullableEdgeInsetsGeometryProperty? margin;
  final YgDrivenNullableMatrix4Property? transform;
  final YgDrivenNullableAlignmentGeometryProperty? transformAlignment;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return YgAnimatedBuilder(
      properties: <YgDynamicDrivenProperty?>{
        height,
        width,
        alignment,
        padding,
        decoration,
        foregroundDecoration,
        constraints,
        margin,
        transform,
        transformAlignment,
      },
      builder: (BuildContext context) {
        return Container(
          height: height?.value,
          width: width?.value,
          alignment: alignment?.value,
          padding: padding?.value,
          decoration: decoration?.value,
          foregroundDecoration: foregroundDecoration?.value,
          constraints: constraints?.value,
          margin: margin?.value,
          transform: transform?.value,
          transformAlignment: transformAlignment?.value,
          clipBehavior: clipBehavior,
          child: child,
        );
      },
    );
  }
}
