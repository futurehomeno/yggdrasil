part of yg_states;


typedef YgOffsetProperty<T extends YgState> = YgProperty<T, Offset>;
typedef YgAnimatedOffsetProperty = YgAnimatedProperty<Offset>;
typedef YgDrivenOffsetProperty = YgDrivenProperty<Offset>;

class NonNullableOffsetTween extends Tween<Offset> {
  NonNullableOffsetTween({
    required super.begin,
    required super.end,
  });

  @override
  Offset lerp(double t) => Offset.lerp(
        begin,
        end,
        t,
      )!;
}
