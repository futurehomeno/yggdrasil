import 'package:flutter/material.dart';

import 'yg_checkbox_style.dart';

/// Paints the checkbox icon.
class YgCheckboxIconPainter {
  YgCheckboxIconPainter({
    required this.style,
  });

  final YgCheckboxStyle style;

  static const Offset iconSize = Offset(8, 6);
  static const double strokeWidth = 2;

  // The path points of the check icon.
  static const Offset checkP1 = Offset(0, 3);
  static const Offset checkP2 = Offset(3, 6);
  static const Offset checkP3 = Offset(8, 0);

  // The path points of the line icon.
  static const Offset lineP1 = Offset(0, 3);
  static const Offset lineP2 = Offset(3, 3);
  static const Offset lineP3 = Offset(8, 3);

  final Paint _iconPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  void paint(Canvas canvas, Offset center) {
    final double scale = style.iconScale.value;
    if (scale <= 0) {
      return;
    }

    final double t = style.checkToMinusFraction.value;
    final Offset offset = center - (iconSize * scale * 0.5);

    // Update the paint values.
    _iconPaint.color = style.iconColor.value;
    _iconPaint.strokeWidth = strokeWidth * scale;

    // Interpolate between the points, scale them and add offset to center them.
    final Offset p1 = (Offset.lerp(lineP1, checkP1, t)! * scale) + offset;
    final Offset p2 = (Offset.lerp(lineP2, checkP2, t)! * scale) + offset;
    final Offset p3 = (Offset.lerp(lineP3, checkP3, t)! * scale) + offset;

    // Create and draw the path using the path points.
    final Path path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy);

    canvas.drawPath(path, _iconPaint);
  }
}
