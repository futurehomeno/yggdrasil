part of yg_states;


/// Builds a [Padding] using [padding].
///
/// Does not animate its own properties like [AnimatedPadding], instead accepts
/// [YgNullableEdgeInsetsProperty] for padding which is already animated.
class YgAnimatedPadding extends StatelessWidget {
  const YgAnimatedPadding({
    super.key,
    required this.padding,
    required this.child,
  });

  /// See [Padding.padding].
  final YgDrivenEdgeInsetsProperty padding;

  /// See [Padding.child].
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: padding,
      builder: (BuildContext context, _) {
        return Padding(
          padding: padding.value,
          child: child,
        );
      },
    );
  }
}
