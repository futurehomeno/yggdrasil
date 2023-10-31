import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Paints a [ShapeBorder] using [shape].
class YgAnimatedShapeBorderPainter extends StatelessWidget {
  const YgAnimatedShapeBorderPainter({
    super.key,
    required this.child,
    required this.shape,
    this.borderOnForeground = true,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The shape which gets painted.
  final YgDrivenNullableShapeBorderProperty shape;

  /// Whether the [shape] should be painted in front or behind [child].
  final bool borderOnForeground;

  @override
  Widget build(BuildContext context) {
    final _ShapeBorderPainter painter = _ShapeBorderPainter(
      textDirection: Directionality.maybeOf(context),
      shapeBorder: shape,
    );

    return CustomPaint(
      painter: borderOnForeground ? null : painter,
      foregroundPainter: borderOnForeground ? painter : null,
      child: child,
    );
  }
}

class _ShapeBorderPainter extends CustomPainter {
  _ShapeBorderPainter({
    required this.shapeBorder,
    required this.textDirection,
  }) : super(repaint: shapeBorder);

  final YgDrivenNullableShapeBorderProperty shapeBorder;
  final TextDirection? textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    shapeBorder.value?.paint(
      canvas,
      Offset.zero & size,
      textDirection: textDirection,
    );
  }

  @override
  bool shouldRepaint(_ShapeBorderPainter oldDelegate) {
    return oldDelegate.shapeBorder != shapeBorder;
  }
}
