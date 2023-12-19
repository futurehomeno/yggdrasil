import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_overlay/yg_overlay_link.dart';

import '_yg_overlay.dart';
import 'yg_overlay_target.dart';

class YgOverlayFollower extends SingleChildRenderObjectWidget {
  const YgOverlayFollower({
    super.key,
    required this.positionOverlay,
    required this.constrainOverlay,
    required this.overlayLink,
    required super.child,
  });

  final OverlayConstrainer? constrainOverlay;
  final OverlayPositioner? positionOverlay;
  final YgOverlayLink overlayLink;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgOverlayFollowerRenderer(
      positionOverlay: positionOverlay,
      constrainOverlay: constrainOverlay,
      overlayLink: overlayLink,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant YgOverlayFollowerRenderer renderObject,
  ) {
    renderObject.positionOverlay = positionOverlay;
    renderObject.overlayLink = overlayLink;
    renderObject.constrainOverlay = constrainOverlay;
  }
}

class YgOverlayFollowerRenderer extends RenderProxyBox {
  YgOverlayFollowerRenderer({
    required OverlayPositioner? positionOverlay,
    required YgOverlayLink overlayLink,
    required OverlayConstrainer? constrainOverlay,
  })  : _positionOverlay = positionOverlay,
        _overlayLink = overlayLink,
        _constrainOverlay = constrainOverlay;

  OverlayPositioner? _positionOverlay;
  OverlayPositioner? get positionOverlay => _positionOverlay;
  set positionOverlay(OverlayPositioner? newValue) {
    if (_positionOverlay != newValue) {
      _positionOverlay = newValue;
      markNeedsLayout();
    }
  }

  OverlayConstrainer? _constrainOverlay;
  OverlayConstrainer? get constrainOverlay => _constrainOverlay;
  set constrainOverlay(OverlayConstrainer? newValue) {
    if (_constrainOverlay != newValue) {
      _constrainOverlay = newValue;
      markNeedsLayout();
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

    final Rect rect = _getRect();

    child.layout(_constrainOverlay?.call(rect, constraints) ?? constraints, parentUsesSize: true);
    child.data.offset = _positionOverlay?.call(rect, constraints, child.size) ?? Offset.zero;
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! BoxParentData) {
      child.parentData = BoxParentData();
    }
  }

  Rect _getRect() {
    final YgOverlayTargetRenderer? target = _overlayLink.target;
    if (target == null) {
      return Rect.zero;
    }

    return target.rect;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }

    context.paintChild(child, child.data.offset + offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final RenderBox? child = this.child;
    if (child == null) {
      return false;
    }

    return result.addWithPaintOffset(
      offset: child.data.offset,
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
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    final RenderBox? child = this.child;
    if (child == null) {
      return 0.0;
    }

    final double? result = child.getDistanceToActualBaseline(baseline);
    if (result != null) {
      return result + child.data.offset.dy;
    }

    return null;
  }
}

/// Private extension to make interacting with parentData easier.
extension on RenderObject {
  BoxParentData get data => (parentData as BoxParentData);
}
