import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

class YgAnimatedPadding extends StatelessWidget {
  const YgAnimatedPadding({
    super.key,
    required this.padding,
    required this.child,
  });

  final YgDrivenEdgeInsetsProperty padding;
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
