import 'package:flutter/material.dart';

class NonNullableTextStyleTween extends Tween<TextStyle> {
  NonNullableTextStyleTween({
    required super.begin,
    required super.end,
  });

  @override
  TextStyle lerp(double t) => TextStyle.lerp(
        begin,
        end,
        t,
      )!;
}
