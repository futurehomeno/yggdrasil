import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Clips [child] using [shape].
class YgAnimatedShapeBorderClipper extends StatelessWidget {
  const YgAnimatedShapeBorderClipper({
    super.key,
    required this.child,
    required this.shape,
  });

  /// See [ClipPath.child].
  final Widget child;

  /// See [ShapeBorderClipper.shape]
  final YgDrivenNullableShapeBorderProperty shape;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: shape,
      builder: (BuildContext context, _) {
        final ShapeBorder? shape = this.shape.value;

        if (shape == null) {
          return child;
        }

        return ClipPath(
          clipper: ShapeBorderClipper(
            shape: shape,
          ),
          child: child,
        );
      },
    );
  }
}
