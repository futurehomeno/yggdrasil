import 'package:flutter/material.dart';

/// Links together an [YgOverlayFollower] and a [YgOverlayTarget].
class YgOverlayLink {
  /// The target [RenderBox].
  RenderBox? target;

  Rect? _rect;
  Size? _targetSize;

  /// Should be called whenever the target gets layed out with the new size of
  /// the target.
  void onTargetLayout(Size? newValue) {
    _targetSize = newValue;
    _rect = null;
  }

  /// Gets the rect of the target relative to the given overlay.
  Rect getTargetRect(OverlayState overlay) {
    Rect? rect = _rect;

    if (rect != null) {
      return rect;
    }

    final RenderBox? target = this.target;

    if (target == null) {
      return Rect.zero;
    }

    final Offset offset = target.localToGlobal(
      Offset.zero,
      ancestor: overlay.context.findRenderObject(),
    );

    rect = offset & (_targetSize ?? Size.zero);
    _rect = rect;

    return rect;
  }
}
