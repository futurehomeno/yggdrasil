import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgAlignmentGeometryProperty<T extends Enum> = YgProperty<T, AlignmentGeometry>;
typedef YgMaterialAlignmentGeometryProperty = YgMaterialProperty<AlignmentGeometry>;
typedef YgAnimatedAlignmentGeometryProperty = YgAnimatedProperty<AlignmentGeometry>;
typedef YgDrivenAlignmentGeometryProperty = YgDrivenProperty<AlignmentGeometry>;

class NonNullableAlignmentGeometryTween extends Tween<AlignmentGeometry> {
  NonNullableAlignmentGeometryTween({
    required super.begin,
    required super.end,
  });

  @override
  AlignmentGeometry lerp(double t) => AlignmentGeometry.lerp(
        begin,
        end,
        t,
      )!;
}
