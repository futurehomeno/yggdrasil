import 'package:flutter/material.dart';

class NullableAlignmentTween extends Tween<Alignment?> {
  NullableAlignmentTween({
    super.begin,
    super.end,
  });

  @override
  Alignment? lerp(double t) => Alignment.lerp(
        begin,
        end,
        t,
      );
}
