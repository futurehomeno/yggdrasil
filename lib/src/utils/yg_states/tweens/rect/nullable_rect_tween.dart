import 'package:flutter/material.dart';

class NullableRectTween extends Tween<Rect?> {
  NullableRectTween({
    super.begin,
    super.end,
  });

  @override
  Rect? lerp(double t) => Rect.lerp(
        begin,
        end,
        t,
      );
}
