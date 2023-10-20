import 'package:flutter/material.dart';

class NullableShapeBorderTween extends Tween<ShapeBorder?> {
  NullableShapeBorderTween({
    super.begin,
    super.end,
  });

  @override
  ShapeBorder? lerp(double t) => ShapeBorder.lerp(
        begin,
        end,
        t,
      );
}
