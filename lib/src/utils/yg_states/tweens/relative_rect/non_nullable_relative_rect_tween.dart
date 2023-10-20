import 'package:flutter/material.dart';

class NonNullableRelativeRectTween extends Tween<RelativeRect> {
  NonNullableRelativeRectTween({
    required super.begin,
    required super.end,
  });

  @override
  RelativeRect lerp(double t) => RelativeRect.lerp(
        begin,
        end,
        t,
      )!;
}
