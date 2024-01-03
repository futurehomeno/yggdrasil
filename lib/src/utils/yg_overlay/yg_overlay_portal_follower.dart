import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '_yg_overlay.dart';

/// Allows you to implement an overlay child which follows a target widget.
class YgOverlayPortalFollower extends SingleChildRenderObjectWidget {
  const YgOverlayPortalFollower({
    super.key,
    required this.positionOverlay,
    required this.constrainOverlay,
    required this.overlayLink,
    required super.child,
  });

  /// Calculates the [BoxConstraints] of the child widget.
  final OverlayConstrainer? constrainOverlay;

  /// Calculates the [Offset] of the child widget.
  final OverlayPositioner? positionOverlay;

  /// Links this widget to a [YgOverlayTarget].
  final YgOverlayLink overlayLink;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgOverlayPortalFollowerRenderer(
      positionOverlay: positionOverlay,
      constrainOverlay: constrainOverlay,
      overlayLink: overlayLink,
      overlay: Overlay.of(context),
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant YgOverlayPortalFollowerRenderer renderObject,
  ) {
    renderObject.positionOverlay = positionOverlay;
    renderObject.overlayLink = overlayLink;
    renderObject.constrainOverlay = constrainOverlay;
    renderObject.overlay = Overlay.of(context);
  }
}

class YgOverlayPortalFollowerRenderer extends YgOverlayFollowerRenderer {
  YgOverlayPortalFollowerRenderer({
    required OverlayPositioner? positionOverlay,
    required OverlayConstrainer? constrainOverlay,
    required super.overlayLink,
    required super.overlay,
  })  : _positionOverlay = positionOverlay,
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

  @override
  void layoutChild(RenderBox child, Rect target) {
    child.layout(_constrainOverlay?.call(target, constraints) ?? constraints, parentUsesSize: true);
    child.data.offset = _positionOverlay?.call(target, constraints, child.size) ?? Offset.zero;
  }
}

/// Private extension to make interacting with parentData easier.
extension on RenderObject {
  BoxParentData get data => (parentData as BoxParentData);
}
