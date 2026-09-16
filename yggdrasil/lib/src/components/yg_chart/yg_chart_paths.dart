import 'dart:math' as math;

import 'package:flutter/rendering.dart';

/// Path builders shared by the painters of [YgChart] and [YgChartSimple], so
/// line and band series look the same on both charts.
class YgChartPaths {
  const YgChartPaths._();

  /// Builds a path through [points] with slightly curved corners.
  ///
  /// Each corner is cut [curveHalfLength] before and after the shared point
  /// and bridged with a conic curve, shortened to half of a segment when the
  /// segment is too short for the full cut.
  static Path linePath(List<Offset> points, {required double curveHalfLength}) {
    final Path path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      final Offset start = points[i - 1];
      final Offset end = points[i];
      final Offset delta = end - start;
      final double segmentLength = delta.distance;
      if (segmentLength == 0.0) {
        continue;
      }

      final Offset direction = delta / segmentLength;
      final double cutLength = math.min(curveHalfLength, segmentLength / 2.0);

      if (i > 1) {
        // Curve into this segment around the shared corner point.
        final Offset curveEnd = start + direction * cutLength;
        path.conicTo(start.dx, start.dy, curveEnd.dx, curveEnd.dy, 1.0);
      }

      final bool isLast = i == points.length - 1;
      final Offset lineEnd = isLast ? end : end - direction * cutLength;
      path.lineTo(lineEnd.dx, lineEnd.dy);
    }

    return path;
  }

  /// Builds a path of straight segments through [points].
  static Path straightPath(List<Offset> points) {
    return Path()..addPolygon(points, false);
  }

  /// Builds the closed outline of a band: along the upper bound, down to the
  /// lower bound and back along it to the start.
  ///
  /// Built from straight segments, matching the raw look of the band center
  /// line.
  static Path bandPath(List<Offset> upperPoints, List<Offset> lowerPoints) {
    return Path()..addPolygon(
      <Offset>[...upperPoints, ...lowerPoints.reversed],
      true,
    );
  }
}
