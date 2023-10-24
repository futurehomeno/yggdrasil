import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgColorProperty<T extends Enum> = YgProperty<T, Color>;
typedef YgMaterialColorProperty = YgMaterialProperty<Color>;
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
