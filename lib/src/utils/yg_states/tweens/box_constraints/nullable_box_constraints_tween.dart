import 'package:flutter/material.dart';

class NullableBoxConstraintsTween extends Tween<BoxConstraints?> {
  NullableBoxConstraintsTween({
    super.begin,
    super.end,
  });

  @override
  BoxConstraints? lerp(double t) => BoxConstraints.lerp(
        begin,
        end,
        t,
      );
}
