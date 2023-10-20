import 'package:flutter/material.dart';

class NonNullableBorderTween extends Tween<Border> {
  NonNullableBorderTween({
    required super.begin,
    required super.end,
  });

  @override
  Border lerp(double t) => Border.lerp(
        begin,
        end,
        t,
      )!;
}
