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
      overlayLink: overlayLink,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgOverlayTargetRenderer renderObject) {
    renderObject.overlayLink = overlayLink;
  }
}

class YgOverlayTargetRenderer extends RenderProxyBox {
  YgOverlayTargetRenderer({
    required YgOverlayLink overlayLink,
  }) : _overlayLink = overlayLink {
    _overlayLink.target = this;
  }

  YgOverlayLink _overlayLink;
  YgOverlayLink get overlayLink => _overlayLink;
  set overlayLink(YgOverlayLink newOverlayLink) {
    if (_overlayLink != newOverlayLink) {
      markNeedsLayout();
      _overlayLink = newOverlayLink;
    }
    // CompositedTransformFollower
    RepaintBoundary
  }

  @override
  void performLayout() {
    super.performLayout();
    _overlayLink.targetSize = size;
  }
}
