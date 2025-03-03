part of yg_states;


typedef YgNullableColorProperty<T extends YgState> = YgProperty<T, Color?>;
typedef YgAnimatedNullableColorProperty = YgAnimatedProperty<Color?>;
typedef YgDrivenNullableColorProperty = YgDrivenProperty<Color?>;

class NullableColorTween extends Tween<Color?> {
  NullableColorTween({
    super.begin,
    super.end,
  });

  @override
  Color? lerp(double t) => Color.lerp(
        begin,
        end,
        t,
      );
}
