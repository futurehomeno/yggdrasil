import 'package:flutter/material.dart';

class NonNullableRectTween extends Tween<Rect> {
  NonNullableRectTween({
    required super.begin,
    required super.end,
  });

  @override
  Rect lerp(double t) => Rect.lerp(
        begin,
        end,
        t,
      )!;
}
