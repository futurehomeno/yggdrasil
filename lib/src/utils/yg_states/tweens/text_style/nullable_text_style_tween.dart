import 'package:flutter/material.dart';

class NullableTextStyleTween extends Tween<TextStyle?> {
  NullableTextStyleTween({
    super.begin,
    super.end,
  });

  @override
  TextStyle? lerp(double t) => TextStyle.lerp(
        begin,
        end,
        t,
      );
}
