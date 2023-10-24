import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgAnimatedConstrainedBox extends StatelessWidget {
  const YgAnimatedConstrainedBox({
    super.key,
    required this.constraints,
    required this.child,
  });

  final YgDrivenBoxConstraintsProperty constraints;
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
