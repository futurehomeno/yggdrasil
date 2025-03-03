part of yg_states;


typedef YgBorderSideProperty<T extends YgState> = YgProperty<T, BorderSide>;
typedef YgAnimatedBorderSideProperty = YgAnimatedProperty<BorderSide>;
typedef YgDrivenBorderSideProperty = YgDrivenProperty<BorderSide>;

class NonNullableBorderSideTween extends Tween<BorderSide> {
  NonNullableBorderSideTween({
    required super.begin,
    required super.end,
  });

  @override
  BorderSide lerp(double t) => BorderSide.lerp(
        begin!,
        end!,
        t,
      );
}
