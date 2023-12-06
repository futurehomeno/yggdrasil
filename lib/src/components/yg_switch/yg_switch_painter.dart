import 'package:flutter/material.dart';

import 'yg_switch_style.dart';

class YgSwitchPainter extends CustomPainter {
  YgSwitchPainter({
    required this.style,
  }) : super(repaint: style);

  /// The style used to paint the switch.
  final YgSwitchStyle style;

  /// Paint used to paint the track (area behind the handle).
  final Paint _trackPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  /// Paint used to paint the handle.
  final Paint _handlePaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate half width/height and total radius of the handle.
    final double halfWidth = size.width / 2;
    final double halfHeight = size.height / 2;
    final double handleRadius = style.handleDiameter.value / 2;
    final double totalRadius = style.handlePadding.value + handleRadius;
    final double xOffset = (style.width.value / 2) - totalRadius;

    // Define start/end points and handle position.
    final Offset start = Offset(halfWidth - xOffset, halfHeight);
    final Offset end = Offset(halfWidth + xOffset, halfHeight);
    final Offset handlePosition = Offset.lerp(start, end, style.handlePositionFraction.value)!;

    // Set track stroke width/color and handle color.
    _trackPaint.strokeWidth = totalRadius * 2;
    _trackPaint.color = style.trackColor.value;
    _handlePaint.color = style.handleColor.value;

    // Draw track line and handle circle.
    canvas.drawLine(start, end, _trackPaint);
    canvas.drawCircle(handlePosition, handleRadius, _handlePaint);
  }

  @override
  bool shouldRepaint(YgSwitchPainter oldDelegate) => oldDelegate.style != style;

  @override
  bool shouldRebuildSemantics(YgSwitchPainter oldDelegate) => false;
}
