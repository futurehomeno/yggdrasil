import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'yg_debug_properties.dart';

/// A design debugging widget.
///
/// Provides debugging outlines for designers which indicate the bounds of every
/// custom widget we implement.
class YgDebug extends SingleChildRenderObjectWidget {
  const YgDebug({
    super.key,
    required super.child,
  });

  /// Repaints every instance of [YgDebug].
  ///
  /// !--- IMPORTANT ---
  /// This action is very expensive as it repaints every instance of this widget.
  /// Only use when changing debug properties!
  static void repaintAllInstances(BuildContext context) {
    void rebuild(Element el) {
      el.visitChildren(rebuild);
      final RenderObject? renderObject = el.renderObject;
      if (renderObject is _YgDebugChild) {
        renderObject.markNeedsPaint();
      }
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _YgDebugChild();
  }
}

class _YgDebugChild extends RenderProxyBox {
  _YgDebugChild();

  static final Paint _paint = Paint()
    ..color = const Color(0x80ff00ff)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(
    PaintingContext context,
    Offset offset,
  ) {
    final RenderBox? child = this.child;

    if (child == null) {
      return;
    }

    // We always first draw the child.
    context.paintChild(child, offset);

    if (debugOutlineEnabled) {
      final Path path = Path();

      path.moveTo(offset.dx, offset.dy);
      path.lineTo(offset.dx + size.width, offset.dy);
      path.lineTo(offset.dx + size.width, size.height + offset.dy);
      path.lineTo(offset.dx, size.height + offset.dy);
      path.lineTo(offset.dx, offset.dy);

      context.canvas.drawPath(path, _paint);
    }
  }
}
