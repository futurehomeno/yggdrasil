import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'yg_overlay_link.dart';

class YgOverlayTarget extends SingleChildRenderObjectWidget {
  const YgOverlayTarget({
    super.key,
    required super.child,
    required this.overlay,
    required this.overlayLink,
  });

  final OverlayState overlay;
  final YgOverlayLink overlayLink;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final YgOverlayTargetRenderer renderObject = YgOverlayTargetRenderer(
      overlay: overlay,
      overlayLink: overlayLink,
    );
    overlayLink.target = renderObject;

    return renderObject;
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgOverlayTargetRenderer renderObject) {
    overlayLink.target = renderObject;
    renderObject.overlayLink = overlayLink;
    renderObject.overlay = overlay;
  }
}

class YgOverlayTargetRenderer extends RenderProxyBox {
  YgOverlayTargetRenderer({
    required OverlayState overlay,
    required YgOverlayLink overlayLink,
  })  : _overlay = overlay,
        _overlayLink = overlayLink;

  OverlayState _overlay;
  OverlayState get overlay => _overlay;
  set overlay(OverlayState newOverlay) {
    if (_overlay != newOverlay) {
      markNeedsLayout();
      _overlay = newOverlay;
    }
  }

  YgOverlayLink _overlayLink;
  YgOverlayLink get overlayLink => _overlayLink;
  set overlayLink(YgOverlayLink newOverlayLink) {
    if (_overlayLink != newOverlayLink) {
      markNeedsLayout();
      _overlayLink = newOverlayLink;
    }
  }

  @override
  void markNeedsLayout() {
    _overlayLink.needsLayout();
    super.markNeedsLayout();
  }

  Size _size = Size.zero;

  Rect? _rect;
  Rect get rect {
    Rect? rect = _rect;

    if (rect != null) {
      return rect;
    }

    final RenderObject? overlayRenderObject = overlay.context.findRenderObject();

    rect = localToGlobal(
          Offset.zero,
          ancestor: overlayRenderObject,
        ) &
        _size;

    _rect = rect;

    return rect;
  }

  @override
  void performLayout() {
    super.performLayout();
    _rect = null;
    _size = size;
  }
}
