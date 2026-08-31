import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_painter.dart';

/// Paints the scrub indicator of a [YgChartContainer] over the bar of one
/// of its timelines.
///
/// The handle itself is drawn by [YgChartScrubHandle], so it looks the
/// same as the indicator on the chart entries of the container.
class YgChartContainerIndicatorPainter extends CustomPainter {
  YgChartContainerIndicatorPainter({
    required this.fraction,
    required this.barHeight,
    required this.color,
    required this.ringColor,
  });

  /// Horizontal position of the handle as a fraction (0..1) of the width.
  final double fraction;

  /// Height of the timeline bar the handle is drawn over.
  final double barHeight;

  /// Color of the capsule handle.
  final Color color;

  /// Color of the ring around the handle, the surface behind the chart.
  final Color ringColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0.0 || barHeight <= 0.0) {
      return;
    }

    // Keep the handle and its ring fully visible at the very edges of the
    // bar.
    const double halfWidth = YgChartScrubHandle.lineWidth / 2.0 + YgChartScrubHandle.ringWidth;
    final double x = math.max(halfWidth, math.min(size.width - halfWidth, fraction * size.width));

    YgChartScrubHandle.paint(
      canvas,
      x: x,
      top: 0.0,
      bottom: barHeight,
      color: color,
      ringColor: ringColor,
    );
  }

  @override
  bool shouldRepaint(covariant YgChartContainerIndicatorPainter oldDelegate) {
    return oldDelegate.fraction != fraction ||
        oldDelegate.barHeight != barHeight ||
        oldDelegate.color != color ||
        oldDelegate.ringColor != ringColor;
  }
}
