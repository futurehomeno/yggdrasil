import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_debug/yg_debug_properties.dart';

/// Injects a YgDebugWidget in between the build widget.
mixin StatefulWidgetDebugMixin on StatefulWidget {
  @override
  StatefulElement createElement() => _YgDebugStatefulElement(this);
}

mixin StatelessWidgetDebugMixin on StatelessWidget {
  @override
  StatelessElement createElement() => _YgDebugStatelessElement(this);
}

class _YgDebugStatefulElement extends StatefulElement {
  _YgDebugStatefulElement(super.widget);

  @override
  Widget build() {
    return YgDebugWidget(
      child: super.build(),
    );
  }
}

class _YgDebugStatelessElement extends StatelessElement {
  _YgDebugStatelessElement(super.widget);

  @override
  Widget build() {
    return YgDebugWidget(
      child: super.build(),
    );
  }
}

/// A design debugging widget.
///
/// !--- IMPORTANT ---
/// Should be added to every custom top level widget we make.
///
/// Provides debugging outlines for designers which indicate the bounds of every
/// custom widget we implement.
class YgDebugWidget extends SingleChildRenderObjectWidget {
  const YgDebugWidget({
    super.key,
    required super.child,
  });

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
