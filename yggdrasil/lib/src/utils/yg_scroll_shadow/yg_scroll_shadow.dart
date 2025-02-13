import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_scroll_shadow/yg_scroll_shadow_overlay.dart';

/// Applies a shadow at the top or bottom of a scroll view.
class YgScrollShadow extends StatefulWidget {
  const YgScrollShadow({
    super.key,
    required this.child,
  });

  /// The child widget to which the scroll shadow gets applied.
  final Widget child;

  @override
  State<YgScrollShadow> createState() => _YgScrollShadowState();
}

class _YgScrollShadowState extends State<YgScrollShadow> {
  bool _showBottomShadow = false;
  bool _showTopShadow = false;

  void _updateShadows(ScrollMetrics metrics) {
    final bool newShowBottomShadow = metrics.extentAfter != 0;
    final bool newShowTopShadow = metrics.extentBefore != 0;

    if ((_showBottomShadow != newShowBottomShadow) || (_showTopShadow != newShowTopShadow)) {
      _showBottomShadow = newShowBottomShadow;
      _showTopShadow = newShowTopShadow;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: _handleScrollMetricsNotification,
      child: NotificationListener<ScrollUpdateNotification>(
        onNotification: _handleScrollUpdateNotification,
        child: YgScrollShadowOverlay(
          child: widget.child,
        ),
      ),
    );
  }

  bool _handleScrollUpdateNotification(ScrollUpdateNotification notification) {
    if (notification.depth != 0) {
      return false;
    }

    _updateShadows(notification.metrics);

    return false;
  }

  bool _handleScrollMetricsNotification(ScrollMetricsNotification notification) {
    if (notification.depth != 0) {
      return false;
    }

    _updateShadows(notification.metrics);

    return false;
  }
}
