import 'package:flutter/material.dart';

class NonNullableEdgeInsetsGeometryTween extends Tween<EdgeInsetsGeometry> {
  NonNullableEdgeInsetsGeometryTween({
    required super.begin,
    required super.end,
  });

  @override
  EdgeInsetsGeometry lerp(double t) => EdgeInsetsGeometry.lerp(
        begin,
        end,
        t,
      )!;
}
