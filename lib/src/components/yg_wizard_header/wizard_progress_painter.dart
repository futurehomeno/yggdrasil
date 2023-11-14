import 'package:flutter/material.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';

class WizardProgressPainter extends CustomPainter {
  WizardProgressPainter({
    required this.value,
    required this.steps,
    required this.stroke,
    required this.padding,
  }) : super(repaint: value);

  final Animation<double> value;
  final int steps;
  final double stroke;
  final double padding;

  static final Paint _backgroundPaint = Paint()
    ..color = const Color(0xffE0E5F0)
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;

  static final Paint _foregroundPaint = Paint()
    ..color = Colors.blue
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final int correctedSteps = steps - 1;
    final double halfStroke = stroke / 2;
    final double stepWidth = (size.width - correctedSteps * padding) / steps;
    final Path path = Path();

    for (int i = 0; i < steps; i++) {
      final double offset = i * (stepWidth + padding);
      final double length = offset + stepWidth;

      final Offset start = Offset(offset + halfStroke, halfStroke);
      final Offset end = Offset(length - halfStroke, halfStroke);

      path.addLineOutline(start, end, stroke);
    }

    final double relativeValue = (value.value + 1) / steps;
    final Offset start = Offset(halfStroke, halfStroke);
    final Offset backgroundEnd = Offset(size.width - halfStroke, halfStroke);
    final Offset valueEnd = Offset(size.width * relativeValue - halfStroke, halfStroke);

    canvas.clipPath(path);
    canvas.drawLine(start, backgroundEnd, _backgroundPaint);
    canvas.drawLine(start, valueEnd, _foregroundPaint);
  }

  @override
  bool shouldRepaint(WizardProgressPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(WizardProgressPainter oldDelegate) => false;
}
