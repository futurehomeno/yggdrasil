import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableTextStyleProperty<T extends YgState> = YgProperty<T, TextStyle?>;
typedef YgAnimatedNullableTextStyleProperty = YgAnimatedProperty<TextStyle?>;
typedef YgDrivenNullableTextStyleProperty = YgDrivenProperty<TextStyle?>;

class NullableTextStyleTween extends Tween<TextStyle?> {
  NullableTextStyleTween({
    super.begin,
    super.end,
  });

  @override
  TextStyle? lerp(double t) => TextStyle.lerp(
        begin,
        end,
        t,
      );
}
