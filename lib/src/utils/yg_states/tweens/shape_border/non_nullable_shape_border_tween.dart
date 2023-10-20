import 'package:flutter/material.dart';

class NonNullableShapeBorderTween extends Tween<ShapeBorder> {
  NonNullableShapeBorderTween({
    required super.begin,
    required super.end,
  });

  @override
  ShapeBorder lerp(double t) => ShapeBorder.lerp(
        begin,
        end,
        t,
      )!;
}
