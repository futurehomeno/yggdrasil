import 'package:flutter/material.dart';

class NonNullableSizeTween extends Tween<Size> {
  NonNullableSizeTween({
    required super.begin,
    required super.end,
  });

  @override
  Size lerp(double t) => Size.lerp(
        begin,
        end,
        t,
      )!;
}
