import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/src/utils/yg_overlay/yg_overlay_link.dart';

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

  @override
  void performLayout() {
    size = constraints.biggest;

    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }

    final Rect rect = _overlayLink.getTargetRect(_overlay);

    layoutChild(child, rect);
  }

  Offset get childOffset => child?.data.offset ?? Offset.zero;

  // This rule makes no sense here.
  // ignore: check-for-equals-in-render-object-setters
  set childOffset(Offset newOffset) {
    final RenderBox? child = this.child;

    if (child == null) {
      return;
    }

    child.data.offset = newOffset;
  }

  void layoutChild(RenderBox child, Rect target);
}

extension on RenderBox {
  BoxParentData get data => parentData as BoxParentData;
}
