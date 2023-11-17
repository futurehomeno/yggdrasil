import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgRectProperty<T extends YgState> = YgProperty<T, Rect>;
typedef YgAnimatedRectProperty = YgAnimatedProperty<Rect>;
typedef YgDrivenRectProperty = YgDrivenProperty<Rect>;

class NonNullableRectTween extends Tween<Rect> {
  NonNullableRectTween({
    required super.begin,
    required super.end,
  });

  @override
  Rect lerp(double t) => Rect.lerp(
        begin,
        end,
        t,
      )!;
}
