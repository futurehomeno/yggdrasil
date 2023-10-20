import 'package:flutter/material.dart';

class NonNullableBoxConstraintsTween extends Tween<BoxConstraints> {
  NonNullableBoxConstraintsTween({
    required super.begin,
    required super.end,
  });

  @override
  BoxConstraints lerp(double t) => BoxConstraints.lerp(
        begin,
        end,
        t,
      )!;
}
