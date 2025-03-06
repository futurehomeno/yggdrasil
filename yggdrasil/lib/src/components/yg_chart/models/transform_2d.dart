import 'package:flutter/rendering.dart';

/// A simple transform which applies both a scale and translate (in that order).
class Transform2D {
  const Transform2D({
    required this.xScale,
    required this.yScale,
    required this.xOffset,
    required this.yOffset,
  });

  static const Transform2D zero = Transform2D(
    xScale: 1,
    yScale: 1,
    xOffset: 0,
    yOffset: 0,
  );

  final double xScale;
  final double yScale;
  final double xOffset;
  final double yOffset;

  Offset apply(num x, num y) {
    return Offset(
      (xScale * x) + xOffset,
      (yScale * y) + yOffset,
    );
  }
}
