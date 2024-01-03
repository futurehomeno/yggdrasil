import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'yg_overlay_link.dart';

class YgOverlayTarget extends SingleChildRenderObjectWidget {
  const YgOverlayTarget({
    super.key,
    required super.child,
    required this.overlayLink,
  });

  /// Used to link this widget to a [YgOverlayFollower].
  final YgOverlayLink overlayLink;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgOverlayTargetRenderer(
      overlay: Overlay.of(context),
      overlayLink: overlayLink,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgOverlayTargetRenderer renderObject) {
    renderObject.overlayLink = overlayLink;
    renderObject.overlay = Overlay.of(context);
  }
}

class YgOverlayTargetRenderer extends RenderProxyBox {
  YgOverlayTargetRenderer({
    required OverlayState overlay,
    required YgOverlayLink overlayLink,
  })  : _overlay = overlay,
        _overlayLink = overlayLink {
    _overlayLink.target = this;
  }

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
  void performLayout() {
    super.performLayout();
    _overlayLink.onTargetLayout(size);
  }
}
