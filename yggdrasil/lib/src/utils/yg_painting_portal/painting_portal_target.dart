import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaintingPortalTarget extends SingleChildRenderObjectWidget {
  const PaintingPortalTarget({
    super.key,
    required super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return PaintingPortalTargetRenderer();
  }
}

class PaintingPortalTargetRenderer extends RenderProxyBox {
  final Map<RenderObject, PaintingPortalEntry> _entries = <RenderObject, PaintingPortalEntry>{};
  Size _cachedSize = Size.zero;
  final Random _random = Random();

  @override
  void performLayout() {
    _cachedSize = constraints.biggest;
    size = _cachedSize;
    child?.layout(BoxConstraints.tight(_cachedSize));
  }

  void updateEntry(RenderObject parent, PaintingPortalEntry entry) {
    _entries[parent] = entry;
  }

  void removeEntry(RenderObject parent) {
    _entries.remove(parent);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

    for (final PaintingPortalEntry entry in _entries.values) {
      final FollowerLayer layer = FollowerLayer(
        link: entry.link,
        showWhenUnlinked: false,
        unlinkedOffset: offset,
        linkedOffset: Offset.zero,
      );

      context.addLayer(layer);

      context.pushLayer(
        layer,
        _paint,
        Offset.zero,
        childPaintBounds: Rect.largest,
      );
    }
  }

  void _paint(PaintingContext context, Offset offset) {
    final Color color = Color.fromRGBO(
      (_random.nextDouble() * 255).floor(),
      (_random.nextDouble() * 255).floor(),
      (_random.nextDouble() * 255).floor(),
      _random.nextDouble(),
    );

    final Paint paint = Paint()..color = color;

    context.canvas.drawRect(offset & const Size(100, 100), paint);
  }

  @override
  bool get isRepaintBoundary => true;

  Size get accessibleSize => _cachedSize;
}

class PaintingPortalEntry {
  PaintingPortalEntry({
    required this.link,
    required this.follower,
  });

  final LayerLink link;
  final RenderObject follower;

  Offset offset = Offset.zero;
}
