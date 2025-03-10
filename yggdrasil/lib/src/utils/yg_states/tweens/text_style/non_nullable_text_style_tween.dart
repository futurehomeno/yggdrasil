part of yg_states;


typedef YgTextStyleProperty<T extends YgState> = YgProperty<T, TextStyle>;
typedef YgAnimatedTextStyleProperty = YgAnimatedProperty<TextStyle>;
typedef YgDrivenTextStyleProperty = YgDrivenProperty<TextStyle>;

class NonNullableTextStyleTween extends Tween<TextStyle> {
  NonNullableTextStyleTween({
    required super.begin,
    required super.end,
  });

  @override
  TextStyle lerp(double t) => TextStyle.lerp(
        begin,
        end,
        t,
      )!;
}
