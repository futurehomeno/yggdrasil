import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgEdgeInsetsGeometryProperty<T extends YgState> = YgProperty<T, EdgeInsetsGeometry>;
typedef YgAnimatedEdgeInsetsGeometryProperty = YgAnimatedProperty<EdgeInsetsGeometry>;
typedef YgDrivenEdgeInsetsGeometryProperty = YgDrivenProperty<EdgeInsetsGeometry>;

class NonNullableEdgeInsetsGeometryTween extends Tween<EdgeInsetsGeometry> {
  NonNullableEdgeInsetsGeometryTween({
    required super.begin,
    required super.end,
  });

  @override
  EdgeInsetsGeometry lerp(double t) => EdgeInsetsGeometry.lerp(
    begin,
    end,
    t,
  )!;
}
