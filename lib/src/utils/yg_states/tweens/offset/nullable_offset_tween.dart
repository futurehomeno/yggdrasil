import 'package:flutter/material.dart';

class NullableOffsetTween extends Tween<Offset?> {
  NullableOffsetTween({
    super.begin,
    super.end,
  });

  @override
  Offset? lerp(double t) => Offset.lerp(
        begin,
        end,
        t,
      );
}
