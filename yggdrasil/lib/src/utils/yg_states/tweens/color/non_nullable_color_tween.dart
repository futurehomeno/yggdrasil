import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgColorProperty<T extends YgState> = YgProperty<T, Color>;
typedef YgAnimatedColorProperty = YgAnimatedProperty<Color>;
typedef YgDrivenColorProperty = YgDrivenProperty<Color>;

class NonNullableColorTween extends Tween<Color> {
  NonNullableColorTween({
    required super.begin,
    required super.end,
  });

  @override
  Color lerp(double t) => Color.lerp(
    begin,
    end,
    t,
  )!;
}
