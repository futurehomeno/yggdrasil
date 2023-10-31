import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgBorderProperty<T extends Enum> = YgProperty<T, Border>;
typedef YgMaterialBorderProperty = YgMaterialProperty<Border>;
typedef YgAnimatedBorderProperty = YgAnimatedProperty<Border>;
typedef YgDrivenBorderProperty = YgDrivenProperty<Border>;

class NonNullableBorderTween extends Tween<Border> {
  NonNullableBorderTween({
    required super.begin,
    required super.end,
  });

  @override
  Border lerp(double t) => Border.lerp(
        begin,
        end,
        t,
      )!;
}
