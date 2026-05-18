import 'package:flutter/widgets.dart';

class YgInteractionConfig {
  const YgInteractionConfig({
    this.zoom = false,
    this.scroll = true,
    this.overlays,
  });

  /// Allow zooming in on the index range.
  final bool zoom;

  /// Allow scrolling when the current index range is a subset of the total range.
  final bool scroll;

  final List<Widget>? overlays;
}
