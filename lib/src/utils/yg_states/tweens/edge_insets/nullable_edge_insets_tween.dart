import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableEdgeInsetsProperty<T extends Enum> = YgProperty<T, EdgeInsets?>;
typedef YgMaterialNullableEdgeInsetsProperty = YgMaterialProperty<EdgeInsets?>;
typedef YgAnimatedNullableEdgeInsetsProperty = YgAnimatedProperty<EdgeInsets?>;
typedef YgDrivenNullableEdgeInsetsProperty = YgDrivenProperty<EdgeInsets?>;

class NullableEdgeInsetsTween extends Tween<EdgeInsets?> {
  NullableEdgeInsetsTween({
    super.begin,
    super.end,
  });

  @override
  EdgeInsets? lerp(double t) => EdgeInsets.lerp(
        begin,
        end,
        t,
      );
}
