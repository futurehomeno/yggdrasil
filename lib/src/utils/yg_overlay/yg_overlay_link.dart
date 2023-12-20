import 'package:flutter/material.dart';

/// Links together an [YgOverlayFollower] and a [YgOverlayTarget].
class YgOverlayLink {
  /// The target [RenderBox].
  RenderBox? target;

  /// The [Size] of the target.
  ///
  /// Not accessible during the build step.
  Size? targetSize;

  /// Gets the rect of the target relative to the given overlay.
  Rect getTargetRect(OverlayState overlay) {
    final RenderBox? target = this.target;

    if (target == null) {
      return Rect.zero;
    }

    final Offset offset = target.localToGlobal(
      Offset.zero,
      ancestor: overlay.context.findRenderObject(),
    );

    return offset & (targetSize ?? Size.zero);
  }
}
