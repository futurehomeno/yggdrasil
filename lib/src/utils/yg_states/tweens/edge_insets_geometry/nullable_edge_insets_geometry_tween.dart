import 'package:flutter/material.dart';

class NullableEdgeInsetsGeometryTween extends Tween<EdgeInsetsGeometry?> {
  NullableEdgeInsetsGeometryTween({
    super.begin,
    super.end,
  });

  @override
  EdgeInsetsGeometry? lerp(double t) => EdgeInsetsGeometry.lerp(
        begin,
        end,
        t,
      );
}
