import 'package:flutter/animation.dart';

class OffsetTween extends Tween<Offset?> {
  OffsetTween({
    super.begin,
    super.end,
  });

  @override
  Offset? lerp(double t) => Offset.lerp(
        begin,
        end,
        t,
      );
}
