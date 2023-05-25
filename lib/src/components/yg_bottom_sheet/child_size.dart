import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef ResizeCallback = void Function(Size size);

class ChildSize extends SingleChildRenderObjectWidget {
  const ChildSize({
    super.key,
    required super.child,
    required this.resizeCallback,
  });

  final ResizeCallback resizeCallback;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderChildSize(
      resizeCallback: resizeCallback,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderChildSize renderObject) {
    renderObject.resizeCallback = resizeCallback;
  }
}

class RenderChildSize extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  RenderChildSize({
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
