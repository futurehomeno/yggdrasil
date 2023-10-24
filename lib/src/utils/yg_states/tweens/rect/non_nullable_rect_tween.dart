import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgRectProperty<T extends Enum> = YgProperty<T, Rect>;
typedef YgMaterialRectProperty = YgMaterialProperty<Rect>;
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
