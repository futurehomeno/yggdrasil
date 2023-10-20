import 'package:flutter/material.dart';

class NonNullableAlignmentGeometryTween extends Tween<AlignmentGeometry> {
  NonNullableAlignmentGeometryTween({
    required super.begin,
    required super.end,
  });

  @override
  AlignmentGeometry lerp(double t) => AlignmentGeometry.lerp(
        begin,
        end,
        t,
      )!;
}
