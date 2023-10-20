import 'package:flutter/material.dart';

class NonNullableBorderRadiusTween extends Tween<BorderRadius> {
  NonNullableBorderRadiusTween({
    required super.begin,
    required super.end,
  });

  @override
  BorderRadius lerp(double t) => BorderRadius.lerp(
        begin,
        end,
        t,
      )!;
}
