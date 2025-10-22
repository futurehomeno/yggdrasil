import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableAlignmentGeometryProperty<T extends YgState> = YgProperty<T, AlignmentGeometry?>;
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
