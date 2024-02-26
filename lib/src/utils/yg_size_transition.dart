import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Renders multiple widgets on top of each other while animating its own size.
///
/// Renders the last widget on the bottom. The value of [animation] is used to
/// lerp between the size of the last widget and the widget before it, the
/// result is used as the size of this widget.
///
/// Should probably be used in combination of a fade transition and a clipper to
/// complete the switching effect.
class YgSizeTransition extends MultiChildRenderObjectWidget {
  const YgSizeTransition({
    super.key,
    required super.children,
    required this.animation,
  });

  final Animation<double> animation;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSizeTransitionRenderer(
      controller: animation,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSizeTransitionRenderer renderObject) {
    renderObject.controller = animation;
  }
}

class YgSizeTransitionRendererParentData extends ContainerBoxParentData<RenderBox> {}

class YgSizeTransitionRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgSizeTransitionRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgSizeTransitionRendererParentData> {
  YgSizeTransitionRenderer({
    required Animation<double> controller,
  }) : _controller = controller {
    controller.addListener(markNeedsLayout);
  }

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgSizeTransitionRendererParentData();
  }

  Animation<double> _controller;
  Animation<double> get controller => _controller;
  set controller(Animation<double> newController) {
    if (_controller != newController) {
      _controller.removeListener(markNeedsLayout);
      _controller = newController;
      _controller.addListener(markNeedsLayout);
    }
  }

  @override
  void performLayout() {
    for (RenderBox? child = firstChild; child != null; child = childAfter(child)) {
      child.layout(
        constraints,
        parentUsesSize: true,
      );
    }

    final RenderBox? lastChild = this.lastChild;
    if (lastChild == null) {
      size = constraints.smallest;
      return;
    }

    final Size targetSize = lastChild.size;
    final Size? previous = childBefore(lastChild)?.size;

    if (previous != null) {
      size = Size.lerp(
        previous,
        targetSize,
        _controller.value,
      )!;
    } else {
      size = targetSize;
    }

    for (RenderBox? child = firstChild; child != null; child = childAfter(child)) {
      final YgSizeTransitionRendererParentData parentData = (child.parentData as YgSizeTransitionRendererParentData);
      final Size childSize = child.size;
      parentData.offset = (size - childSize as Offset) / 2;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    RenderBox? child = lastChild;
    while (child != null) {
      final YgSizeTransitionRendererParentData childParentData =
          (child.parentData as YgSizeTransitionRendererParentData);
      context.paintChild(child, childParentData.offset + offset);
      child = childParentData.previousSibling;
    }
  }

  @override
  double defaultComputeDistanceToFirstActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToFirstActualBaseline(baseline);
  }

  @override
  double defaultComputeDistanceToHighestActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}
