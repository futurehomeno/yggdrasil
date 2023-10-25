import 'dart:ui';

import 'package:flutter/widgets.dart';

/// Rounded rectangle border with gradient.
///
/// The default [RoundedRectangleBorder] does not support gradient.
class YgRoundedRectangleGradientBorder extends OutlinedBorder {
  const YgRoundedRectangleGradientBorder({
    required this.gradient,
    this.borderRadius = BorderRadius.zero,
    this.width = 1.0,
  });

  /// The gradient to use when filling the shape.
  final Gradient gradient;

  /// The radii for each corner.
  final BorderRadiusGeometry borderRadius;

  /// The width of the border.
  final double width;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (width == 0.0) {
      canvas.drawRRect(borderRadius.resolve(textDirection).toRRect(rect), side.toPaint());
    } else {
      final Paint paint = Paint()..shader = gradient.createShader(rect);
      final RRect outer = borderRadius.resolve(textDirection).toRRect(rect);
      final RRect inner = outer.deflate(width);
      canvas.drawDRRect(outer, inner, paint);
    }
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  ShapeBorder scale(double t) {
    return YgRoundedRectangleGradientBorder(
      gradient: gradient,
      borderRadius: borderRadius * t,
      width: width * t,
    );
  }

  @override
  YgRoundedRectangleGradientBorder copyWith({BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    // Gradient rectangle border does not support copying with border side.
    return this;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final RRect borderRect = borderRadius.resolve(textDirection).toRRect(rect);
    final RRect adjustedRect = borderRect.deflate(side.width * (side.strokeAlign - 1) * -0.5);

    return Path()..addRRect(adjustedRect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b == null) {
      if (t == 1) {
        return null;
      }

      return scale(t);
    }

    if (b is YgRoundedRectangleGradientBorder) {
      return YgRoundedRectangleGradientBorder(
        gradient: Gradient.lerp(gradient, b.gradient, t)!,
        borderRadius: BorderRadiusGeometry.lerp(borderRadius, b.borderRadius, t)!,
        width: lerpDouble(width, b.width, t)!,
      );
    }

    if (t < 0.5) {
      return scale(t * 2);
    }

    return b.scale((t * 2) - 1);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a == null) {
      if (t == 0) {
        return null;
      }

      return scale(t);
    }

    if (a is YgRoundedRectangleGradientBorder) {
      return YgRoundedRectangleGradientBorder(
        gradient: Gradient.lerp(a.gradient, gradient, t)!,
        borderRadius: BorderRadiusGeometry.lerp(a.borderRadius, borderRadius, t)!,
        width: lerpDouble(a.width, width, t)!,
      );
    }

    if (t > 0.5) {
      return scale((t * 2) - 1);
    }

    return a.scale(t * 2);
  }
}
