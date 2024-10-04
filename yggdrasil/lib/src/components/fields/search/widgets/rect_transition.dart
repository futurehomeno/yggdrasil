import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RRectTransition extends SingleChildRenderObjectWidget {
  const RRectTransition({
    super.key,
    super.child,
    required this.animation,
    required this.rrect,
  });

  final Animation<double> animation;
  final RRect rrect;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RRectTransitionRenderer(
      animation: animation,
      rrect: rrect,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant RRectTransitionRenderer renderObject) {
    renderObject.animation = animation;
    renderObject.rrect = rrect;
  }
}

class RRectTransitionRenderer extends RenderProxyBox {
  RRectTransitionRenderer({
    required Animation<double> animation,
    required RRect rrect,
  })  : _rrect = rrect,
        _animation = animation;

  Animation<double> _animation;
  Animation<double> get animation => _animation;
  set animation(Animation<double> newValue) {
    if (_animation != newValue) {
      _animation.removeListener(markNeedsPaint);
      _animation = newValue;
      _animation.addListener(markNeedsPaint);
      markNeedsPaint();
    }
  }

  RRect _rrect;
  RRect get rrect => _rrect;
  set rrect(RRect newValue) {
    if (_rrect != newValue) {
      _rrect = newValue;
      markNeedsPaint();
    }
  }

  @override
  void attach(PipelineOwner owner) {
    _animation.addListener(markNeedsPaint);
    super.attach(owner);
  }

  @override
  void detach() {
    _animation.removeListener(markNeedsPaint);
    super.detach();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }

    final RRect outerRRect = RRect.fromRectXY(offset & size, 0, 0);
    final RRect lerpResult = RRect.lerp(
      _rrect,
      outerRRect,
      _animation.value,
    )!;

    ContainerLayer? layer = this.layer;
    if (layer is ClipRRectLayer) {
      layer.clipRRect = lerpResult;
    } else {
      layer = ClipRRectLayer(
        clipRRect: lerpResult,
      );

      this.layer = layer;
    }

    void paint2(PaintingContext context, Offset offset) {
      final int alpha = min(255, (animation.value * 255 * 3).toInt());

      if (alpha > 254) {
        context.paintChild(child, offset);
      } else {
        context.pushOpacity(offset, alpha, child.paint);
      }
    }

    void paint(PaintingContext context, Offset offset) {
      final Matrix4 transform = Matrix4.identity()..scale(lerpResult.width / outerRRect.width);

      context.pushTransform(true, offset, transform, paint2);
    }

    context.pushLayer(
      layer,
      paint,
      Offset(lerpResult.left, lerpResult.top),
    );
  }
}
