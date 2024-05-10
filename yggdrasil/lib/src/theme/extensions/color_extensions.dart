import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  Color lerp(Color b, double t) {
    return Color.lerp(this, b, t)!;
  }
}
