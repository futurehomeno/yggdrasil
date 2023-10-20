import 'package:flutter/material.dart';

class NonNullableColorTween extends Tween<Color> {
  NonNullableColorTween({
    required super.begin,
    required super.end,
  });

  @override
  Color lerp(double t) => Color.lerp(
        begin,
        end,
        t,
      )!;
}
