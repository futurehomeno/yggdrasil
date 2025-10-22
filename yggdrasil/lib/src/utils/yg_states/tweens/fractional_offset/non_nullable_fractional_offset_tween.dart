import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgFractionalOffsetProperty<T extends YgState> = YgProperty<T, FractionalOffset>;
typedef YgAnimatedFractionalOffsetProperty = YgAnimatedProperty<FractionalOffset>;
typedef YgDrivenFractionalOffsetProperty = YgDrivenProperty<FractionalOffset>;

class NonNullableFractionalOffsetTween extends Tween<FractionalOffset> {
  NonNullableFractionalOffsetTween({
    required super.begin,
    required super.end,
  });

  @override
  FractionalOffset lerp(double t) => FractionalOffset.lerp(
    begin,
    end,
    t,
  )!;
}
