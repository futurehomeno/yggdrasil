import 'package:flutter/material.dart';

class NullableBorderTween extends Tween<Border?> {
  NullableBorderTween({
    super.begin,
    super.end,
  });

  @override
  Border? lerp(double t) => Border.lerp(
        begin,
        end,
        t,
      );
}
