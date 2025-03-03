part of yg_states;


typedef YgNullableBorderProperty<T extends YgState> = YgProperty<T, Border?>;
typedef YgAnimatedNullableBorderProperty = YgAnimatedProperty<Border?>;
typedef YgDrivenNullableBorderProperty = YgDrivenProperty<Border?>;

class NullableBorderTween extends Tween<Border?> {
  NullableBorderTween({
    super.begin,
    super.end,
  });

  @override
  Border? lerp(double t) => Border.lerp(
        begin,
        end,
        t,
      );
}
