import 'package:flutter/material.dart';

class NullableRelativeRectTween extends Tween<RelativeRect?> {
  NullableRelativeRectTween({
    super.begin,
    super.end,
  });

  @override
  RelativeRect? lerp(double t) => RelativeRect.lerp(
        begin,
        end,
        t,
      );
}
