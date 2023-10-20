import 'package:flutter/material.dart';

class NullableColorTween extends Tween<Color?> {
  NullableColorTween({
    super.begin,
    super.end,
  });

  @override
  Color? lerp(double t) => Color.lerp(
        begin,
        end,
        t,
      );
}
