import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Builds a [SizedBox] using [size].
class YgAnimatedSizedBox extends StatelessWidget {
  const YgAnimatedSizedBox({
    super.key,
    required this.size,
    required this.child,
  });

  /// The additional constraints to impose on the child.
  final YgDrivenSizeProperty size;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: size,
      builder: (BuildContext context, _) {
        return SizedBox.fromSize(
          size: size.value,
          child: child,
        );
      },
    );
  }
}
