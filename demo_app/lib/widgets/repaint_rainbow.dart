import 'package:flutter/material.dart';

/// Widget useful for debugging repaints in specific areas.
class RepaintRainbow extends StatelessWidget {
  const RepaintRainbow({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: RepaintRainbowPainter(),
      child: child,
    );
  }
}

class RepaintRainbowPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = _strokeWidth;

  double _hue = 0;

  static const double _strokeWidth = 10;

  @override
  void paint(Canvas canvas, Size size) {
    _hue = (_hue + 1) % 360;

    _paint.color = HSLColor.fromAHSL(
      1,
      _hue,
      1,
      0.5,
    ).toColor();

    canvas.drawRect(
      (Offset.zero & size).deflate(_strokeWidth / 2),
      _paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
