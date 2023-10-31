import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableRelativeRectProperty<T extends Enum> = YgProperty<T, RelativeRect?>;
typedef YgMaterialNullableRelativeRectProperty = YgMaterialProperty<RelativeRect?>;
typedef YgAnimatedNullableRelativeRectProperty = YgAnimatedProperty<RelativeRect?>;
typedef YgDrivenNullableRelativeRectProperty = YgDrivenProperty<RelativeRect?>;

class NullableRelativeRectTween extends Tween<RelativeRect?> {
  NullableRelativeRectTween({
    super.begin,
    super.end,
  });

  @override
  RelativeRect? lerp(double t) => RelativeRect.lerp(
        begin,
        end,
        t,
      );
}
