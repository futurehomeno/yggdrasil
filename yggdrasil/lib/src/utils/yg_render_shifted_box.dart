import 'package:flutter/rendering.dart';

/// A simple box for rendering a child box with a offset.
abstract class YgRenderShiftedBox extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! BoxParentData) {
      child.parentData = BoxParentData();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }

    final BoxParentData parentData = child.parentData as BoxParentData;
    context.paintChild(child, parentData.offset + offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final RenderBox? child = this.child;
    if (child == null) {
      return false;
    }

    final BoxParentData parentData = child.parentData as BoxParentData;

    return result.addWithPaintOffset(
      offset: parentData.offset,
      position: position,
      hitTest: (BoxHitTestResult result, Offset transformed) {
        return child.hitTest(
          result,
          position: transformed,
        );
      },
    );
  }

  @override
  void applyPaintTransform(covariant RenderObject child, Matrix4 transform) {
    final BoxParentData parentData = child.parentData as BoxParentData;

    transform.translate(
      parentData.offset.dx,
      parentData.offset.dy,
    );
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    final RenderBox? child = this.child;
    if (child == null) {
      return 0.0;
    }

    final double? result = child.getDistanceToActualBaseline(baseline);
    if (result != null) {
      final BoxParentData parentData = child.parentData as BoxParentData;

      return result + parentData.offset.dy;
    }

    return null;
  }

  Offset get childOffset {
    final RenderBox? child = this.child;
    if (child == null) {
      return Offset.zero;
    }

    final BoxParentData parentData = child.parentData as BoxParentData;

    return parentData.offset;
  }

  // ignore: check-for-equals-in-render-object-setters
  set childOffset(Offset offset) {
    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }

    final BoxParentData parentData = child.parentData as BoxParentData;
    parentData.offset = offset;
  }
}
