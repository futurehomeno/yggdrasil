import 'package:flutter/material.dart';

class NullableSizeTween extends Tween<Size?> {
  NullableSizeTween({
    super.begin,
    super.end,
  });

  @override
  Size? lerp(double t) => Size.lerp(
        begin,
        end,
        t,
      );
}
