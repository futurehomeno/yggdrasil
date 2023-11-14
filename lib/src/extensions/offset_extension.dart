import 'dart:math';

import 'package:flutter/material.dart';

extension OffsetExtension on Offset {
  double angleTo(Offset other) => atan2(other.dy - dy, other.dx - dx);

  Offset translateWithAngle(double angle, double distance) {
    return Offset(
      dx + distance * cos(angle),
      dy + distance * sin(angle),
    );
  }
}
