import 'package:flutter/material.dart';

class NullableBorderRadiusTween extends Tween<BorderRadius?> {
  NullableBorderRadiusTween({
    super.begin,
    super.end,
  });

  @override
  BorderRadius? lerp(double t) => BorderRadius.lerp(
        begin,
        end,
        t,
      );
}
