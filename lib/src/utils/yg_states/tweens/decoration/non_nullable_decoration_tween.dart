import 'package:flutter/material.dart';

class NonNullableDecorationTween extends Tween<Decoration> {
  NonNullableDecorationTween({
    required super.begin,
    required super.end,
  });

  @override
  Decoration lerp(double t) => Decoration.lerp(
        begin,
        end,
        t,
      )!;
}
