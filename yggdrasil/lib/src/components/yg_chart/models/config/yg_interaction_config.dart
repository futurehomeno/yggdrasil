import 'package:flutter/widgets.dart';

class YgInteractionConfig {
  const YgInteractionConfig({
    this.zoom = false,
    this.tooltip,
  });

  final bool zoom;
  final Widget? tooltip;
}
