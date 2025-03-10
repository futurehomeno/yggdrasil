part of yg_states;


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
