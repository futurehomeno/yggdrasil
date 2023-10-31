import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgTextStyleProperty<T extends Enum> = YgProperty<T, TextStyle>;
typedef YgMaterialTextStyleProperty = YgMaterialProperty<TextStyle>;
typedef YgAnimatedTextStyleProperty = YgAnimatedProperty<TextStyle>;
typedef YgDrivenTextStyleProperty = YgDrivenProperty<TextStyle>;

class NonNullableTextStyleTween extends Tween<TextStyle> {
  NonNullableTextStyleTween({
    required super.begin,
    required super.end,
  });

  @override
  TextStyle lerp(double t) => TextStyle.lerp(
        begin,
        end,
        t,
      )!;
}
