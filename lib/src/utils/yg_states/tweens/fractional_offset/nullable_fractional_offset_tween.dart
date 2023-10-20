import 'package:flutter/material.dart';

class NullableFractionalOffsetTween extends Tween<FractionalOffset?> {
  NullableFractionalOffsetTween({
    super.begin,
    super.end,
  });

  @override
  FractionalOffset? lerp(double t) => FractionalOffset.lerp(
        begin,
        end,
        t,
      );
}
