import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgAlignmentProperty<T extends YgState> = YgProperty<T, Alignment>;
typedef YgAnimatedAlignmentProperty = YgAnimatedProperty<Alignment>;
typedef YgDrivenAlignmentProperty = YgDrivenProperty<Alignment>;

class NonNullableAlignmentTween extends Tween<Alignment> {
  NonNullableAlignmentTween({
    required super.begin,
    required super.end,
  });

  @override
  Alignment lerp(double t) => Alignment.lerp(
    begin,
    end,
    t,
  )!;
}
