import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle lerp(TextStyle b, double t) {
    return TextStyle.lerp(this, b, t)!;
  }
}
