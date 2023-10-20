import 'package:flutter/material.dart';

class NonNullableFractionalOffsetTween extends Tween<FractionalOffset> {
  NonNullableFractionalOffsetTween({
    required super.begin,
    required super.end,
  });

  @override
  FractionalOffset lerp(double t) => FractionalOffset.lerp(
        begin,
        end,
        t,
      )!;
}
