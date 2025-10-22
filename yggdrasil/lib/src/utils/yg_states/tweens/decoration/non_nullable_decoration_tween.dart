import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgDecorationProperty<T extends YgState> = YgProperty<T, Decoration>;
typedef YgAnimatedDecorationProperty = YgAnimatedProperty<Decoration>;
typedef YgDrivenDecorationProperty = YgDrivenProperty<Decoration>;

class NonNullableDecorationTween extends Tween<Decoration> {
  NonNullableDecorationTween({
    required super.begin,
    required super.end,
  });

  @override
  Decoration lerp(double t) => Decoration.lerp(
    begin,
    end,
    t,
  )!;
}
