import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_scroll_shadow/yg_scroll_shadow_gradient.dart';

/// Internal widget which applies scroll shadow to a child widget.
///
/// Requires you to specify whether there should be a scroll shadow on the top
/// or bottom, if you instead want this to be done automatically, use
/// [YgScrollShadow] instead.
class YgScrollShadowOverlay extends StatelessWidget {
  const YgScrollShadowOverlay({
    super.key,
    required this.child,
    this.bottom,
    this.top,
  });

  /// The child widget which gets scroll shadow applied to it.
  final Widget child;

  /// Whether to show the bottom scroll shadow.
  final bool? bottom;

  /// Whether to show the top scroll shadow.
  final bool? top;

  @override
  Widget build(BuildContext context) {
    final bool? bottom = this.bottom;
    final bool? top = this.top;

    return Stack(
      children: <Widget>[
        child,
        if (bottom != null)
          _buildShadow(
            alignment: Alignment.bottomCenter,
            shown: bottom,
          ),
        if (top != null)
          _buildShadow(
            alignment: Alignment.topCenter,
            shown: top,
          ),
      ],
    );
  }

  Widget _buildShadow({
    required bool shown,
    required Alignment alignment,
  }) {
    return Positioned(
      bottom: alignment.y > 0 ? 0 : null,
      top: alignment.y < 0 ? 0 : null,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: YgScrollShadowGradient(
          alignment: alignment,
          shown: shown,
        ),
      ),
    );
  }
}
