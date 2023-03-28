import 'package:flutter/widgets.dart';

class YgRoundedRectangleGradientBorder extends RoundedRectangleBorder {
  const YgRoundedRectangleGradientBorder({
    required this.gradient,
    required super.borderRadius,
    this.width = 1.0,
  });

  final Gradient gradient;
  final double width;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (width == 0.0) {
      canvas.drawRRect(
          borderRadius.resolve(textDirection).toRRect(rect), side.toPaint());
    } else {
      final Paint paint = Paint()..shader = gradient.createShader(rect);
      if (side.strokeAlign == StrokeAlign.inside) {
        final RRect outer = borderRadius.resolve(textDirection).toRRect(rect);
        final RRect inner = outer.deflate(width);
        canvas.drawDRRect(outer, inner, paint);
      } else {
        final Rect inner;
        final Rect outer;
        if (side.strokeAlign == StrokeAlign.center) {
          inner = rect.deflate(width / 2);
          outer = rect.inflate(width / 2);
        } else {
          inner = rect;
          outer = rect.inflate(width);
        }
        final BorderRadius borderRadiusResolved =
            borderRadius.resolve(textDirection);
        canvas.drawDRRect(borderRadiusResolved.toRRect(outer),
            borderRadiusResolved.toRRect(inner), paint);
      }
    }
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
