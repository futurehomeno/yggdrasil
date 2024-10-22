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
      animation: animation,
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
    required Animation<double> animation,
  }) : _animation = animation;

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgSizeTransitionRendererParentData();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _animation.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _animation.removeListener(markNeedsLayout);
    super.detach();
  }

  Animation<double> _animation;
  Animation<double> get controller => _animation;
  set controller(Animation<double> newAnimation) {
    if (_animation != newAnimation) {
      _animation.removeListener(markNeedsLayout);
      _animation = newAnimation;
      _animation.addListener(markNeedsLayout);
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
        _animation.value,
      )!;
    } else {
      size = targetSize;
    }

    for (RenderBox? child = firstChild; child != null; child = childAfter(child)) {
      final YgSizeTransitionRendererParentData parentData = (child.parentData as YgSizeTransitionRendererParentData);
      parentData.offset = (size - child.size as Offset) / 2;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    for (RenderBox? child = lastChild; child != null; child = childBefore(child)) {
      final YgSizeTransitionRendererParentData parentData = (child.parentData as YgSizeTransitionRendererParentData);
      context.paintChild(child, parentData.offset + offset);
    }
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToFirstActualBaseline(baseline);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}
