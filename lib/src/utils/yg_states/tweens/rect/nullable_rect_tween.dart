import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableRectProperty<T extends YgState> = YgProperty<T, Rect?>;
typedef YgAnimatedNullableRectProperty = YgAnimatedProperty<Rect?>;
typedef YgDrivenNullableRectProperty = YgDrivenProperty<Rect?>;

class NullableRectTween extends Tween<Rect?> {
  NullableRectTween({
    super.begin,
    super.end,
  });

  @override
  Rect? lerp(double t) => Rect.lerp(
        begin,
        end,
        t,
      );
}
