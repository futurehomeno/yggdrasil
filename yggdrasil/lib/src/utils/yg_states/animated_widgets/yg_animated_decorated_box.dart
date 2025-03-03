part of yg_states;


/// DecoratedBox which animates between decorations.
class YgAnimatedDecoratedBox extends StatelessWidget {
  const YgAnimatedDecoratedBox({
    super.key,
    this.child,
    required this.decoration,
  });

  /// For more info see [DecoratedBox.child].
  final Widget? child;

  /// Animates the decoration of this container.
  ///
  /// For more info see [DecoratedBox.decoration].
  final YgDrivenDecorationProperty decoration;

  @override
  Widget build(BuildContext context) {
    return YgAnimatedBuilder(
      properties: <YgDynamicDrivenProperty?>{
        decoration,
      },
      builder: (BuildContext context, _) {
        return DecoratedBox(
          decoration: decoration.value,
          child: child,
        );
      },
    );
  }
}
