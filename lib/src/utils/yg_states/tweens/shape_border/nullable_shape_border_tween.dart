import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef NullableShapeBorder = ShapeBorder?;
typedef YgNullableShapeBorderProperty<T extends Enum> = YgProperty<T, ShapeBorder?>;
typedef YgMaterialNullableShapeBorderProperty = YgMaterialProperty<ShapeBorder?>;
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
