import 'package:flutter/rendering.dart';

/// A simple transform which applies both a scale and translate (in that order).
class Transform {
  const Transform({
    required this.xScale,
    required this.yScale,
    required this.xOffset,
    required this.yOffset,
  });

  final double xScale;
  final double yScale;
  final double xOffset;
  final double yOffset;

  Offset apply(double x, double y) {
    return Offset(
      (xScale * x) + xOffset,
      (yScale * y) + yOffset,
    );
  }
}
