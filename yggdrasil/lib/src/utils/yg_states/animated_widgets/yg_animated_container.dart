import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Container which accepts animated properties.
///
/// Does not animate its own properties like [AnimatedContainer], instead
/// accepts [YgDrivenProperty] for its properties which are already animated.
/// For more info on the specific properties see [Container].
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
  }) : assert(
         color == null || decoration == null,
         'Cannot provide both a color and a decoration\n'
         'The color argument is just a shorthand for "decoration: BoxDecoration(color: color)".',
       ),
       decoration = decoration ?? color?.map((Color color) => BoxDecoration(color: color));

  /// For more info see [Container.child].
  final Widget? child;

  /// Animates the width of this container.
  ///
  /// For more info see [Container.width].
  final YgDrivenNullableDoubleProperty? width;

  /// Animates the height of this container.
  ///
  /// For more info see [Container.height].
  final YgDrivenNullableDoubleProperty? height;

  /// Animates the alignment of [child].
  ///
  /// For more info see [Container.alignment].
  final YgDrivenNullableAlignmentGeometryProperty? alignment;

  /// Animates the padding of this container.
  ///
  /// For more info see [Container.padding].
  final YgDrivenNullableEdgeInsetsGeometryProperty? padding;

  /// Animates the decoration of this container.
  ///
  /// For more info see [Container.decoration].
  final YgDrivenNullableDecorationProperty? decoration;

  /// Animates the foreground decoration of this container.
  ///
  /// For more info see [Container.foregroundDecoration].
  final YgDrivenNullableDecorationProperty? foregroundDecoration;

  /// Animates the constraints of this container.
  ///
  /// For more info see [Container.constraints].
  final YgDrivenNullableBoxConstraintsProperty? constraints;

  /// Animates the margin of this container.
  ///
  /// For more info see [Container.margin].
  final YgDrivenNullableEdgeInsetsGeometryProperty? margin;

  /// Animates the transformAlignment of this container.
  ///
  /// For more info see [Container.transformAlignment].
  final YgDrivenNullableAlignmentGeometryProperty? transformAlignment;

  /// Animates the transform of this container.
  ///
  /// For more info see [Container.transform].
  final YgDrivenMatrix4Property? transform;

  /// For more info see [Container.clipBehavior].
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
      builder: (BuildContext context, _) {
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
