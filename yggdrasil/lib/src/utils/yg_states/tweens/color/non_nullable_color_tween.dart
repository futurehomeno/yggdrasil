part of yg_states;


typedef YgColorProperty<T extends YgState> = YgProperty<T, Color>;
typedef YgAnimatedColorProperty = YgAnimatedProperty<Color>;
typedef YgDrivenColorProperty = YgDrivenProperty<Color>;

class NonNullableColorTween extends Tween<Color> {
  NonNullableColorTween({
    required super.begin,
    required super.end,
  });

  @override
  Color lerp(double t) => Color.lerp(
        begin,
        end,
        t,
      )!;
}
