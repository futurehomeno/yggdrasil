import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableAlignmentProperty<T extends YgState> = YgProperty<T, Alignment?>;
typedef YgAnimatedNullableAlignmentProperty = YgAnimatedProperty<Alignment?>;
typedef YgDrivenNullableAlignmentProperty = YgDrivenProperty<Alignment?>;

class NullableAlignmentTween extends Tween<Alignment?> {
  NullableAlignmentTween({
    super.begin,
    super.end,
  });

  @override
  Alignment? lerp(double t) => Alignment.lerp(
        begin,
        end,
        t,
      );
}
