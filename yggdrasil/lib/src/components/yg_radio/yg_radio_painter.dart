import 'package:flutter/material.dart';

import 'yg_radio_style.dart';

class YgRadioPainter extends CustomPainter {
  YgRadioPainter({
    required this.style,
  }) : super(repaint: style);

  final YgRadioStyle style;

  final Paint backgroundPaint = Paint();
  final Paint centerDotPaint = Paint();
  final Paint borderPaint = Paint()..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double actualSize = style.radioSize.value;
    final double borderSize = style.borderSize.value;
    final double radius = (actualSize - borderSize) / 2;

    backgroundPaint.color = style.backgroundColor.value;
    centerDotPaint.color = style.centerDotColor.value;
    borderPaint.color = style.borderColor.value;
    borderPaint.strokeWidth = borderSize;

    canvas.drawCircle(
      center,
      radius,
      backgroundPaint,
    );

    canvas.drawCircle(
      center,
      radius,
      borderPaint,
    );

    canvas.drawCircle(
      center,
      style.centerDotSize.value / 2,
      centerDotPaint,
    );
  }

  @override
  bool shouldRepaint(covariant YgRadioPainter oldDelegate) {
    return style != oldDelegate.style;
  }
}
