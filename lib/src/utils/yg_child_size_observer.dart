import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef ResizeCallback = void Function(Size size);

class YgChildSizeObserver extends SingleChildRenderObjectWidget {
  const YgChildSizeObserver({
    super.key,
    required super.child,
    required this.resizeCallback,
  });

  final ResizeCallback resizeCallback;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgRenderChildSizeObserver(
      resizeCallback: resizeCallback,
    );
  }

  @override
  void updateRenderObject(BuildContext context, YgRenderChildSizeObserver renderObject) {
    renderObject.resizeCallback = resizeCallback;
  }
}

class YgRenderChildSizeObserver extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  YgRenderChildSizeObserver({
    required ResizeCallback resizeCallback,
  }) : _resizeCallback = resizeCallback;

  Size _lastSize = Size.zero;

  ResizeCallback _resizeCallback;

  ResizeCallback get resizeCallback {
    return _resizeCallback;
  }

  set resizeCallback(ResizeCallback value) {
    _resizeCallback = value;
    _resizeCallback(_lastSize);
  }

  @override
  void performLayout() {
    final RenderBox? child = this.child;
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      size = child.size;

      if (_lastSize != size) {
        _lastSize = size;
        _resizeCallback(_lastSize);
      }
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child != null) {
      child.paint(context, offset);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final RenderBox? child = this.child;
    if (child != null) {
      return child.hitTest(
        result,
        position: position,
      );
    }
    return false;
  }
}
