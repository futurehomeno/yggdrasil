import 'package:flutter/material.dart';

import 'yg_checkbox_icon_painter.dart';
import 'yg_checkbox_style.dart';

/// Paints the checkbox.
class YgCheckboxPainter extends CustomPainter {
  YgCheckboxPainter({
    required this.style,
  }) : iconPainter = YgCheckboxIconPainter(style: style),
       super(repaint: style);

  final YgCheckboxStyle style;
  final YgCheckboxIconPainter iconPainter;

  final Paint _borderPaint = Paint();
  final Paint _backgroundPaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double realSize = style.size.value;
    final double borderWidth = style.borderWidth.value;
    final BorderRadius borderRadius = style.borderRadius.value;

    // Create a rect at the center of the checkbox with the size of the checkbox.
    final Rect rect = Rect.fromCenter(
      center: center,
      width: realSize,
      height: realSize,
    );

    // Calculate how much the inner border RRect should be scaled down.
    final double borderToCenterFraction = style.borderToCenterFraction.value;
    final double distanceToMiddle = (realSize / 2) - borderWidth;
    final double deflation = distanceToMiddle * borderToCenterFraction;

    // Deflate the rect for innerRRect, not the RRect, to maintain border radius
    // during checkbox check animation. The background RRect should be slightly
    // smaller than the outerRRect to avoid anti-aliasing artifacts.
    final RRect outerRRect = borderRadius.toRRect(rect);
    final RRect innerRRect = borderRadius.toRRect(rect.deflate(deflation)).deflate(borderWidth);
    final RRect backgroundRRect = outerRRect.deflate(borderWidth / 2);

    _borderPaint.color = style.borderColor.value;
    _backgroundPaint.color = style.backgroundColor.value;

    canvas.drawRRect(backgroundRRect, _backgroundPaint);
    canvas.drawDRRect(outerRRect, innerRRect, _borderPaint);

    iconPainter.paint(canvas, center);
  }

  @override
  bool shouldRepaint(covariant YgCheckboxPainter oldDelegate) => oldDelegate.style != style;
}
