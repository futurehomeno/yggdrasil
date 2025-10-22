import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgShapeBorderProperty<T extends YgState> = YgProperty<T, ShapeBorder>;
typedef YgAnimatedShapeBorderProperty = YgAnimatedProperty<ShapeBorder>;
typedef YgDrivenShapeBorderProperty = YgDrivenProperty<ShapeBorder>;

class NonNullableShapeBorderTween extends Tween<ShapeBorder> {
  NonNullableShapeBorderTween({
    required super.begin,
    required super.end,
  });

  @override
  ShapeBorder lerp(double t) => ShapeBorder.lerp(
    begin,
    end,
    t,
  )!;
}
