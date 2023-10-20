import 'package:flutter/material.dart';

class NullableAlignmentGeometryTween extends Tween<AlignmentGeometry?> {
  NullableAlignmentGeometryTween({
    super.begin,
    super.end,
  });

  @override
  AlignmentGeometry? lerp(double t) => AlignmentGeometry.lerp(
        begin,
        end,
        t,
      );
}
