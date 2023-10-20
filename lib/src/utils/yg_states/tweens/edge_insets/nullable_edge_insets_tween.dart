import 'package:flutter/material.dart';

class NullableEdgeInsetsTween extends Tween<EdgeInsets?> {
  NullableEdgeInsetsTween({
    super.begin,
    super.end,
  });

  @override
  EdgeInsets? lerp(double t) => EdgeInsets.lerp(
        begin,
        end,
        t,
      );
}
