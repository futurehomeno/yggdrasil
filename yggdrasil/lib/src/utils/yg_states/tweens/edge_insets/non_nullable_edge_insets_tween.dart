part of yg_states;


typedef YgEdgeInsetsProperty<T extends YgState> = YgProperty<T, EdgeInsets>;
typedef YgAnimatedEdgeInsetsProperty = YgAnimatedProperty<EdgeInsets>;
typedef YgDrivenEdgeInsetsProperty = YgDrivenProperty<EdgeInsets>;

class NonNullableEdgeInsetsTween extends Tween<EdgeInsets> {
  NonNullableEdgeInsetsTween({
    required super.begin,
    required super.end,
  });

  @override
  EdgeInsets lerp(double t) => EdgeInsets.lerp(
        begin,
        end,
        t,
      )!;
}
