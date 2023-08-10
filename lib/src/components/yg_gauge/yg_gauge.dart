import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Arch-style gauge that goes from 0.0 to 1.0.
class YgGauge extends StatelessWidget {
  const YgGauge({
    super.key,
    required this.value,
  });

  /// Current value of the gauge from 0.0 to 1.0.
  ///
  /// Null is treated as 0.0.
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 100.0,
      child: CustomPaint(
        painter: _YgGaugePainter(),
      ),
    );
  }
}

class _YgGaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: const Offset(50.0, 50.0), radius: 45.0);
    // The start of which to dra the arch.
    const double startAngle = math.pi * 2 * 25 / 64;

    // The end of which to draw the arch.
    const double endAngle = math.pi * 2 * 46 / 64;

    final Paint arcPainter = Paint()
      ..shader = const SweepGradient(
        colors: <Color>[
          Color(0xFF05DBA6),
          Color(0xFFFEBE77),
          Color(0xFFEF0654),
        ],
        stops: <double>[
          45 / 360,
          180 / 360,
          315 / 360,
        ],
        transform: GradientRotation(math.pi / 2),
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9.0
      ..strokeCap = StrokeCap.round;
    //draw arc

    canvas.drawArc(
      rect,
      startAngle,
      endAngle,
      false,
      arcPainter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double convertToRadians(double angle) {
    return (math.pi / 180) * angle;
  }

  double convertToDegrees(double radians) {
    return (180 / math.pi) * radians;
  }
}
