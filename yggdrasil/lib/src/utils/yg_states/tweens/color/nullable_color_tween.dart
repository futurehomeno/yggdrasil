import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableColorProperty<T extends YgState> = YgProperty<T, Color?>;
typedef YgAnimatedNullableColorProperty = YgAnimatedProperty<Color?>;
typedef YgDrivenNullableColorProperty = YgDrivenProperty<Color?>;

class NullableColorTween extends Tween<Color?> {
  NullableColorTween({
    super.begin,
    super.end,
  });

  @override
  Color? lerp(double t) => Color.lerp(
    begin,
    end,
    t,
  );
}
