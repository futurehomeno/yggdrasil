import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef NullableBorderRadius = BorderRadius?;
typedef YgNullableBorderRadiusProperty<T extends Enum> = YgProperty<T, BorderRadius?>;
typedef YgMaterialNullableBorderRadiusProperty = YgMaterialProperty<BorderRadius?>;
typedef YgAnimatedNullableBorderRadiusProperty = YgAnimatedProperty<BorderRadius?>;
typedef YgDrivenNullableBorderRadiusProperty = YgDrivenProperty<BorderRadius?>;

class NullableBorderRadiusTween extends Tween<BorderRadius?> {
  NullableBorderRadiusTween({
    super.begin,
    super.end,
  });

  @override
  BorderRadius? lerp(double t) => BorderRadius.lerp(
        begin,
        end,
        t,
      );
}
