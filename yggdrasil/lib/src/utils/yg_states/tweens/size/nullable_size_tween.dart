part of yg_states;


typedef YgNullableSizeProperty<T extends YgState> = YgProperty<T, Size?>;
typedef YgAnimatedNullableSizeProperty = YgAnimatedProperty<Size?>;
typedef YgDrivenNullableSizeProperty = YgDrivenProperty<Size?>;

class NullableSizeTween extends Tween<Size?> {
  NullableSizeTween({
    super.begin,
    super.end,
  });

  @override
  Size? lerp(double t) => Size.lerp(
        begin,
        end,
        t,
      );
}
