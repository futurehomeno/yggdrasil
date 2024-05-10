import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableFractionalOffsetProperty<T extends YgState> = YgProperty<T, FractionalOffset?>;
typedef YgAnimatedNullableFractionalOffsetProperty = YgAnimatedProperty<FractionalOffset?>;
typedef YgDrivenNullableFractionalOffsetProperty = YgDrivenProperty<FractionalOffset?>;

class NullableFractionalOffsetTween extends Tween<FractionalOffset?> {
  NullableFractionalOffsetTween({
    super.begin,
    super.end,
  });

  @override
  FractionalOffset? lerp(double t) => FractionalOffset.lerp(
        begin,
        end,
        t,
      );
}
