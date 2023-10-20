import 'package:flutter/material.dart';

class NonNullableOffsetTween extends Tween<Offset> {
  NonNullableOffsetTween({
    required super.begin,
    required super.end,
  });

  @override
  Offset lerp(double t) => Offset.lerp(
        begin,
        end,
        t,
      )!;
}
