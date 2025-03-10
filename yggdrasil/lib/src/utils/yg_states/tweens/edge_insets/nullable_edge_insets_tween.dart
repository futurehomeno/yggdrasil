part of yg_states;


typedef YgNullableEdgeInsetsProperty<T extends YgState> = YgProperty<T, EdgeInsets?>;
typedef YgAnimatedNullableEdgeInsetsProperty = YgAnimatedProperty<EdgeInsets?>;
typedef YgDrivenNullableEdgeInsetsProperty = YgDrivenProperty<EdgeInsets?>;

class NullableEdgeInsetsTween extends Tween<EdgeInsets?> {
  NullableEdgeInsetsTween({
    super.begin,
    super.end,
  });

  @override
  EdgeInsets? lerp(double t) => EdgeInsets.lerp(
        begin,
        end,
        t,
      );
}
