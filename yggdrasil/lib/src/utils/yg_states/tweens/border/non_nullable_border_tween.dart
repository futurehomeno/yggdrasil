part of yg_states;


typedef YgBorderProperty<T extends YgState> = YgProperty<T, Border>;
typedef YgAnimatedBorderProperty = YgAnimatedProperty<Border>;
typedef YgDrivenBorderProperty = YgDrivenProperty<Border>;

class NonNullableBorderTween extends Tween<Border> {
  NonNullableBorderTween({
    required super.begin,
    required super.end,
  });

  @override
  Border lerp(double t) => Border.lerp(
        begin,
        end,
        t,
      )!;
}
