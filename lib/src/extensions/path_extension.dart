import 'dart:math';

import 'package:flutter/material.dart';

import '_extensions.dart';

extension PathExtension on Path {
  /// Adds the outline of a line with rounded end caps to the path.
  ///
  /// Accepts [strokeWidth] to specify the width of the line of which the
  /// outline is drawn.
  void addLineOutline(
    Offset p1,
    Offset p2,
    double strokeWidth,
  ) {
    final double angle = p1.angleTo(p2) + (pi / 2);
    final double halfStroke = strokeWidth / 2;
    final Offset start = p1.translateWithAngle(angle, halfStroke);

    // Move to start.
    moveTo(
      start.dx,
      start.dy,
    );

    // Start cap.
    arcTo(
      Rect.fromCircle(
        center: p1,
        radius: halfStroke,
      ),
      angle,
      pi,
      false,
    );

    // End cap.
    arcTo(
      Rect.fromCircle(
        center: p2,
        radius: halfStroke,
      ),
      angle + pi,
      pi,
      false,
    );

    // Close path.
    close();
  }

  /// Adds the outline of a arc with rounded end caps to the path.
  ///
  /// Accepts [strokeWidth] to specify the width of the line of the arc of which
  /// the outline is drawn.
  void addArcOutline(
    Rect rect,
    double startAngle,
    double sweepAngle,
    double strokeWidth,
  ) {
    // Calculate the radius by taking the smallest axis divided by 2.
    final double radius = min(rect.width, rect.height) / 2;

    // Calculate the center of the arc relative to global coordinates.
    final double centerOffsetX = (rect.left + rect.right) / 2;
    final double centerOffsetY = (rect.top + rect.bottom) / 2;
    final Offset center = Offset(centerOffsetX, centerOffsetY);

    // Calculate values that are used more than once for performance reasons.
    final double halfStroke = strokeWidth / 2;
    final double radiusMinusHalfStroke = radius - halfStroke;

    // Sweep angle is relative to the start angle, so to get the actual end
    // angle we have to add them together.
    final double endAngle = startAngle + sweepAngle;

    // Rotate the angles by 180 deg to move them in to the correct place.
    final double rotatedEndAngle = endAngle - pi;
    final double offsetStartAngle = startAngle - pi;

    // Calculate fraction of the offset of the start of the arc. this has to be
    // multiplied by a radius to get the actual starting offset of the arc.
    final double xArcOffsetStartFraction = cos(offsetStartAngle);
    final double yArcOffsetStartFraction = sin(offsetStartAngle);

    final Offset startCapCenter = Offset(
      centerOffsetX - xArcOffsetStartFraction * radius,
      centerOffsetY - yArcOffsetStartFraction * radius,
    );

    final Offset endCapCenter = Offset(
      centerOffsetX - cos(rotatedEndAngle) * radius,
      centerOffsetY - sin(rotatedEndAngle) * radius,
    );

    // Move to start.
    moveTo(
      centerOffsetX - xArcOffsetStartFraction * radiusMinusHalfStroke,
      centerOffsetY - yArcOffsetStartFraction * radiusMinusHalfStroke,
    );

    // Start cap.
    arcTo(
      Rect.fromCircle(
        center: startCapCenter,
        radius: halfStroke,
      ),
      startAngle + pi,
      pi,
      false,
    );

    // Outer line.
    arcTo(
      Rect.fromCircle(
        center: center,
        radius: radius + halfStroke,
      ),
      startAngle,
      sweepAngle,
      false,
    );

    // End cap.
    arcTo(
      Rect.fromCircle(
        center: endCapCenter,
        radius: halfStroke,
      ),
      endAngle,
      pi,
      false,
    );

    // Inner line.
    arcTo(
      Rect.fromCircle(
        center: center,
        radius: radiusMinusHalfStroke,
      ),
      endAngle,
      -sweepAngle,
      false,
    );

    // Close path.
    close();
  }
}
