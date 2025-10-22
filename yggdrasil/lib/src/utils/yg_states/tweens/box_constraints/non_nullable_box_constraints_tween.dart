import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgBoxConstraintsProperty<T extends YgState> = YgProperty<T, BoxConstraints>;
typedef YgAnimatedBoxConstraintsProperty = YgAnimatedProperty<BoxConstraints>;
typedef YgDrivenBoxConstraintsProperty = YgDrivenProperty<BoxConstraints>;

class NonNullableBoxConstraintsTween extends Tween<BoxConstraints> {
  NonNullableBoxConstraintsTween({
    required super.begin,
    required super.end,
  });

  @override
  BoxConstraints lerp(double t) => BoxConstraints.lerp(
    begin,
    end,
    t,
  )!;
}
