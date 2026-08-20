import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_painter.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/models/_models.dart';

/// Paints the bar and axis labels of a [YgStateTimeline].
///
/// The bar is a rounded track (like a progress bar) filled with one segment
/// per state range, proportional to its duration. Gaps between ranges show
/// the track color.
class YgStateTimelinePainter extends CustomPainter {
  YgStateTimelinePainter({
    required this.series,
    required this.start,
    required this.end,
    required this.axisLabels,
    required this.barHeight,
    required this.borderRadius,
    required this.trackColor,
    required this.fallbackSegmentColor,
    required this.axisTextStyle,
  });

  /// Height of the row below the bar showing [axisLabels].
  ///
  /// Matches the x-label row of [YgChartPainter], so a timeline stacked with
  /// a chart gets identical axis rows.
  static const double axisLabelRowHeight = YgChartPainter.xLabelRowHeight;

  final List<YgStateTimelineSeries> series;
  final double start;
  final double end;

  /// Labels distributed evenly below the bar, the first aligned with its
  /// left edge and the last with its right edge.
  final List<String> axisLabels;

  final double barHeight;
  final BorderRadius borderRadius;

  /// Color of the bar where no state is active.
  final Color trackColor;

  /// Color of segments of series without a resolved color.
  final Color fallbackSegmentColor;

  final TextStyle axisTextStyle;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect barRect = Rect.fromLTWH(0.0, 0.0, size.width, barHeight);
    if (barRect.width <= 0.0 || barRect.height <= 0.0) {
      return;
    }

    final double span = end - start;

    canvas.save();
    // scaleRadii keeps the rounded shape valid when the radius exceeds half
    // of the bar height.
    canvas.clipRRect(borderRadius.toRRect(barRect).scaleRadii());

    final Paint segmentPaint = Paint()..color = trackColor;
    canvas.drawRect(barRect, segmentPaint);

    if (span > 0.0) {
      for (final YgStateTimelineSeries currentSeries in series) {
        segmentPaint.color = currentSeries.color ?? fallbackSegmentColor;

        for (final YgStateTimelineRange range in currentSeries.ranges) {
          final double left = ((math.max(range.start, start) - start) / span) * barRect.width;
          final double right = ((math.min(range.end, end) - start) / span) * barRect.width;
          if (right <= left) {
            continue;
          }

          canvas.drawRect(Rect.fromLTRB(left, barRect.top, right, barRect.bottom), segmentPaint);
        }
      }
    }

    canvas.restore();

    _paintAxisLabels(canvas, barRect);
  }

  void _paintAxisLabels(Canvas canvas, Rect barRect) {
    for (int i = 0; i < axisLabels.length; i++) {
      final TextPainter labelPainter = TextPainter(
        text: TextSpan(text: axisLabels[i], style: axisTextStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final double fraction = axisLabels.length == 1 ? 0.0 : i / (axisLabels.length - 1);
      final double anchorX = fraction * barRect.width;

      // The first and last label align with the bar edges instead of being
      // centered on them, so they do not stick out of the bar.
      final double x;
      if (i == 0) {
        x = anchorX;
      } else if (i == axisLabels.length - 1) {
        x = anchorX - labelPainter.width;
      } else {
        x = anchorX - labelPainter.width / 2.0;
      }

      labelPainter
        ..paint(
          canvas,
          Offset(x, barRect.bottom + (axisLabelRowHeight - labelPainter.height) / 2.0),
        )
        ..dispose();
    }
  }

  @override
  bool shouldRepaint(covariant YgStateTimelinePainter oldDelegate) {
    return !_seriesListEquals(oldDelegate.series, series) ||
        oldDelegate.start != start ||
        oldDelegate.end != end ||
        !listEquals(oldDelegate.axisLabels, axisLabels) ||
        oldDelegate.barHeight != barHeight ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.fallbackSegmentColor != fallbackSegmentColor ||
        oldDelegate.axisTextStyle != axisTextStyle;
  }

  /// Compares the series by content.
  ///
  /// [YgStateTimeline] re-creates the series instances on every build when
  /// resolving their colors, so comparing by identity would repaint the
  /// canvas on every rebuild. Range lists are compared by identity: the
  /// color resolution keeps the caller's list instances, so unchanged data
  /// compares equal, and a caller rebuilding its lists merely repaints.
  static bool _seriesListEquals(List<YgStateTimelineSeries> a, List<YgStateTimelineSeries> b) {
    if (a.length != b.length) {
      return false;
    }

    for (int i = 0; i < a.length; i++) {
      if (a[i].id != b[i].id ||
          a[i].label != b[i].label ||
          a[i].color != b[i].color ||
          !identical(a[i].ranges, b[i].ranges)) {
        return false;
      }
    }

    return true;
  }
}
