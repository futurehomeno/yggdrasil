import 'dart:math';

import 'package:flutter/material.dart';

extension OffsetExtension on Offset {
  /// Gets the angle from this to [other] in radians.
  double angleTo(Offset other) => atan2(other.dy - dy, other.dx - dx);

  /// Translates by [distance] in the direction of [angle] in radians.
  Offset translateWithAngle(double angle, double distance) {
    return Offset(
      dx + distance * cos(angle),
      dy + distance * sin(angle),
    );
  }
}
