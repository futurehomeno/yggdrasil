import 'package:flutter/widgets.dart';

class YgRoundedRectangleGradientBorder extends OutlinedBorder {
  const YgRoundedRectangleGradientBorder({
    required this.gradient,
    this.borderRadius = BorderRadius.zero,
    this.width = 1.0,
  });

  final Gradient gradient;

  /// The radii for each corner.
  final BorderRadiusGeometry borderRadius;

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
    return this;
  }

  @override
  YgRoundedRectangleGradientBorder copyWith({BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    // Gradient rectangle border does not support copying with border side.
    return this;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final RRect borderRect = borderRadius.resolve(textDirection).toRRect(rect);
    final RRect adjustedRect;
    switch (side.strokeAlign) {
      case StrokeAlign.inside:
        adjustedRect = borderRect.deflate(side.width);
        break;
      case StrokeAlign.center:
        adjustedRect = borderRect.deflate(side.width / 2);
        break;
      case StrokeAlign.outside:
        adjustedRect = borderRect;
        break;
    }
    return Path()..addRRect(adjustedRect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }
}
