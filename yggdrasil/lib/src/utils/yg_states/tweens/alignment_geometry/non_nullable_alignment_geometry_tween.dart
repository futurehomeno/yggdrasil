part of yg_states;


typedef YgAlignmentGeometryProperty<T extends YgState> = YgProperty<T, AlignmentGeometry>;
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
