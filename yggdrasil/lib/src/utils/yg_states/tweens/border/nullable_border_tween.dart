import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableBorderProperty<T extends YgState> = YgProperty<T, Border?>;
typedef YgAnimatedNullableBorderProperty = YgAnimatedProperty<Border?>;
typedef YgDrivenNullableBorderProperty = YgDrivenProperty<Border?>;

class NullableBorderTween extends Tween<Border?> {
  NullableBorderTween({
    super.begin,
    super.end,
  });

  @override
  Border? lerp(double t) => Border.lerp(
    begin,
    end,
    t,
  );
}
