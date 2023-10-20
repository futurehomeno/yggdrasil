import 'package:flutter/material.dart';

class NonNullableEdgeInsetsTween extends Tween<EdgeInsets> {
  NonNullableEdgeInsetsTween({
    required super.begin,
    required super.end,
  });

  @override
  EdgeInsets lerp(double t) => EdgeInsets.lerp(
        begin,
        end,
        t,
      )!;
}
