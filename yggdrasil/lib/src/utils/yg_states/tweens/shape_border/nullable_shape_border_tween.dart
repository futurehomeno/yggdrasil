import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableShapeBorderProperty<T extends YgState> = YgProperty<T, ShapeBorder?>;
typedef YgAnimatedNullableShapeBorderProperty = YgAnimatedProperty<ShapeBorder?>;
typedef YgDrivenNullableShapeBorderProperty = YgDrivenProperty<ShapeBorder?>;

class NullableShapeBorderTween extends Tween<ShapeBorder?> {
  NullableShapeBorderTween({
    super.begin,
    super.end,
  });

  @override
  ShapeBorder? lerp(double t) => ShapeBorder.lerp(
        begin,
        end,
        t,
      );
}
