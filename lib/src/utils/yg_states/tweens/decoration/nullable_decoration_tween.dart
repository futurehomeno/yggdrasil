import 'package:flutter/material.dart';

class NullableDecorationTween extends Tween<Decoration?> {
  NullableDecorationTween({
    super.begin,
    super.end,
  });

  @override
  Decoration? lerp(double t) => Decoration.lerp(
        begin,
        end,
        t,
      );
}
