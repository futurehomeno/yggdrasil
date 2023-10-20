import 'package:flutter/material.dart';

class NonNullableAlignmentTween extends Tween<Alignment> {
  NonNullableAlignmentTween({
    required super.begin,
    required super.end,
  });

  @override
  Alignment lerp(double t) => Alignment.lerp(
        begin,
        end,
        t,
      )!;
}
