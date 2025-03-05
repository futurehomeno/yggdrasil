import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Allows you to transition a page in from an RRect.
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
    return _RRectTransitionRenderer(
      animation: animation,
      rrect: rrect,
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  void updateRenderObject(BuildContext context, covariant _RRectTransitionRenderer renderObject) {
    renderObject.animation = animation;
    renderObject.rrect = rrect;
  }
}

class _RRectTransitionRenderer extends RenderProxyBox {
  _RRectTransitionRenderer({
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

  // TODO(Tim): This might be possible to optimize a bit, but needs further research.
  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }

    final RRect outerRRect = RRect.fromRectXY(
      offset & size,
      0,
      0,
    );
    final RRect lerpResult = RRect.lerp(
      _rrect,
      outerRRect,
      _animation.value,
    )!;

    if (animation.value == 1) {
      context.paintChild(child, offset);
    } else if (animation.value > 0) {
      ContainerLayer? layer = this.layer;
      if (layer is ClipRRectLayer) {
        layer.clipRRect = lerpResult;
      } else {
        layer = ClipRRectLayer(
          clipRRect: lerpResult,
        );

        this.layer = layer;
      }

      void paintTransformedChild(PaintingContext context, Offset offset) {
        final int alpha = min(255, (animation.value * 255 * 3).toInt());

        context.pushOpacity(
          offset,
          alpha,
          child.paint,
        );
      }

      void paintClippedChild(PaintingContext context, Offset offset) {
        final Matrix4 transform = Matrix4.identity()..scale(lerpResult.width / outerRRect.width);

        context.pushTransform(
          true,
          offset,
          transform,
          paintTransformedChild,
        );
      }

      context.pushLayer(
        layer,
        paintClippedChild,
        Offset(
          lerpResult.left,
          lerpResult.top,
        ),
      );
    }
  }
}
