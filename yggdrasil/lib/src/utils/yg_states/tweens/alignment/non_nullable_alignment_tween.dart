part of yg_states;


typedef YgAlignmentProperty<T extends YgState> = YgProperty<T, Alignment>;
typedef YgAnimatedAlignmentProperty = YgAnimatedProperty<Alignment>;
typedef YgDrivenAlignmentProperty = YgDrivenProperty<Alignment>;

class NonNullableAlignmentTween extends Tween<Alignment> {
  NonNullableAlignmentTween({
    required super.begin,
    required super.end,
  });

  @override
  Alignment lerp(double t) => Alignment.lerp(
        begin,
        end,
        t,
      )!;
}
