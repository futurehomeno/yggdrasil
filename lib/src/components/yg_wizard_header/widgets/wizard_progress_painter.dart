import 'package:flutter/material.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';

/// Paints and animates the progress indicator bar.
class WizardProgressPainter extends CustomPainter {
  WizardProgressPainter({
    required this.value,
    required this.steps,
    required this.stroke,
    required this.gap,
    required this.backgroundColor,
    required this.foregroundColor,
  }) : super(repaint: value);

  /// The animation with the current progress value.
  final Animation<double> value;

  /// The total amount of steps.
  final int steps;

  /// The widget of the progress bar.
  final double stroke;

  /// The space between the bar segments.
  final double gap;

  /// The color of the filled in segments.
  final Color foregroundColor;

  /// The color of the empty segments.
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final double halfStroke = stroke / 2;
    final double stepWidth = (size.width - (steps - 1) * gap) / steps;

    // Create and set the clip path for the bar segments.
    final Path path = Path();

    for (int i = 0; i < steps; i++) {
      final double offset = i * (stepWidth + gap);
      final double length = offset + stepWidth;

      final Offset start = Offset(offset + halfStroke, halfStroke);
      final Offset end = Offset(length - halfStroke, halfStroke);

      path.addLineOutline(start, end, stroke);
    }

    canvas.clipPath(path);

    // Draw the line foreground and background.
    final double relativeValue = (value.value + 1) / steps;
    final Offset start = Offset(halfStroke, halfStroke);
    final Offset backgroundEnd = Offset(size.width - halfStroke, halfStroke);
    final Offset valueEnd = Offset(size.width * relativeValue - halfStroke, halfStroke);

    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = stroke;

    final Paint foregroundPaint = Paint()
      ..color = foregroundColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = stroke;

    canvas.drawLine(start, backgroundEnd, backgroundPaint);
    canvas.drawLine(start, valueEnd, foregroundPaint);
  }

  @override
  bool shouldRepaint(WizardProgressPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(WizardProgressPainter oldDelegate) => false;
}
