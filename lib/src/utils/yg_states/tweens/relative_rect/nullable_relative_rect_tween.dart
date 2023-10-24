import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef NullableRelativeRect = RelativeRect?;
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
