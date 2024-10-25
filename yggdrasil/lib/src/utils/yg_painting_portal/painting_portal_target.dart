import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'scrollable_dropdown.dart';

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
  final List<ScrollableDropdownRenderer> renderers = <ScrollableDropdownRenderer>[];
  Size _cachedSize = Size.zero;
  final Random _random = Random();

  @override
  void performLayout() {
    _cachedSize = constraints.biggest;
    size = _cachedSize;
    child?.layout(BoxConstraints.tight(_cachedSize));
  }

  void addEntry(ScrollableDropdownRenderer parent) {
    renderers.add(parent);
    markNeedsPaint();
  }

  void removeEntry(RenderObject parent) {
    renderers.remove(parent);
  }

  void _paint(PaintingContext context, Offset offset) {
    final Color color = Color.fromRGBO(
      (_random.nextDouble() * 255).floor(),
      (_random.nextDouble() * 255).floor(),
      (_random.nextDouble() * 255).floor(),
      1.0,
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

class EntryRenderBox extends RenderBox {}
