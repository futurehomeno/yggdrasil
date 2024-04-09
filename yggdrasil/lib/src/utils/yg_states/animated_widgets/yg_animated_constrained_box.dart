import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Builds a [ConstrainedBox] using [constraints].
class YgAnimatedConstrainedBox extends StatelessWidget {
  const YgAnimatedConstrainedBox({
    super.key,
    required this.constraints,
    required this.child,
  });

  /// The additional constraints to impose on the child.
  final YgDrivenBoxConstraintsProperty constraints;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: constraints,
      builder: (BuildContext context, _) {
        return ConstrainedBox(
          constraints: constraints.value,
          child: child,
        );
      },
    );
  }
}
