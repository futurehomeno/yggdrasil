import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Build a [IconTheme] using [iconTheme].
class YgAnimatedIconTheme extends StatelessWidget {
  const YgAnimatedIconTheme({
    super.key,
    required this.iconTheme,
    required this.child,
  });

  /// The set of properties to use for icons in this subtree.
  final YgDrivenIconThemeDataProperty iconTheme;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: iconTheme,
      builder: (BuildContext context, _) {
        return IconTheme(
          data: iconTheme.value,
          child: child,
        );
      },
    );
  }
}
