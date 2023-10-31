import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef NullableAlignmentGeometry = AlignmentGeometry?;
typedef YgNullableAlignmentGeometryProperty<T extends Enum> = YgProperty<T, AlignmentGeometry?>;
typedef YgMaterialNullableAlignmentGeometryProperty = YgMaterialProperty<AlignmentGeometry?>;
typedef YgAnimatedNullableAlignmentGeometryProperty = YgAnimatedProperty<AlignmentGeometry?>;
typedef YgDrivenNullableAlignmentGeometryProperty = YgDrivenProperty<AlignmentGeometry?>;

class NullableAlignmentGeometryTween extends Tween<AlignmentGeometry?> {
  NullableAlignmentGeometryTween({
    super.begin,
    super.end,
  });

  @override
  AlignmentGeometry? lerp(double t) => AlignmentGeometry.lerp(
        begin,
        end,
        t,
      );
}
