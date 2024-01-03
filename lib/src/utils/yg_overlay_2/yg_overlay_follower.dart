import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/yg_render_proxy_box_with_offset_child.dart';

import 'yg_overlay_link.dart';

abstract class YgOverlayFollowerRenderer extends YgRenderProxyBoxWithOffsetChild {
  YgOverlayFollowerRenderer({
    required YgOverlayLink overlayLink,
    required OverlayState overlay,
  })  : _overlayLink = overlayLink,
        _overlay = overlay;

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

  Rect _parentRect = Rect.zero;

  @override
  void performLayout() {
    size = constraints.biggest;

    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }

    layoutChild(child, _parentRect);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    final RenderBox? target = _overlayLink.target;

    if (child == null) {
      return;
    }

    if (target != null) {
      _parentRect = target.localToGlobal(
            Offset.zero,
            ancestor: (overlay.context as Element).renderObject,
          ) &
          _overlayLink.targetSize;
    } else {
      _parentRect = Rect.zero;
    }

    child.data.offset = positionChild(
      child.size,
      _parentRect,
    );

    super.paint(context, offset);
  }

  void layoutChild(RenderBox child, Rect rect);

  Offset positionChild(Size childSize, Rect parentRect);
}

extension on RenderBox {
  BoxParentData get data => parentData as BoxParentData;
}
