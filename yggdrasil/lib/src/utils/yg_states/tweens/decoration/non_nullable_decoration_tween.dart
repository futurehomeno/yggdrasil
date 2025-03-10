part of yg_states;


typedef YgDecorationProperty<T extends YgState> = YgProperty<T, Decoration>;
typedef YgAnimatedDecorationProperty = YgAnimatedProperty<Decoration>;
typedef YgDrivenDecorationProperty = YgDrivenProperty<Decoration>;

class NonNullableDecorationTween extends Tween<Decoration> {
  NonNullableDecorationTween({
    required super.begin,
    required super.end,
  });

  @override
  Decoration lerp(double t) => Decoration.lerp(
        begin,
        end,
        t,
      )!;
}
