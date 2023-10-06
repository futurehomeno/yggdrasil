import 'dart:math';

import 'package:flutter/material.dart';

extension PathAddArcOutlineExtension on Path {
  void addArcOutline({
    required Rect rect,
    required double startAngle,
    required double sweepAngle,
    required double strokeWidth,
  }) {
    final double radius = rect.width / 2;
    final double outerRadius = (rect.left + rect.right) / 2;
    final Offset center = Offset(radius + rect.left, radius + rect.top);
    final double halfStroke = strokeWidth / 2;
    final double cosStartAngle = cos(startAngle - pi);
    final double sinStartAngle = sin(startAngle - pi);

    final Offset startCap = Offset(
      outerRadius - cosStartAngle * radius,
      outerRadius - sinStartAngle * radius,
    );

    final double endAngle = startAngle + sweepAngle;
    final Offset endCap = Offset(
      outerRadius - cos(endAngle - pi) * radius,
      outerRadius - sin(endAngle - pi) * radius,
    );

    // Move to start
    moveTo(
      outerRadius - cosStartAngle * (radius - halfStroke),
      outerRadius - sinStartAngle * (radius - halfStroke),
    );

    // Start cap
    arcTo(
      Rect.fromCircle(
        center: startCap,
        radius: halfStroke,
      ),
      startAngle + pi,
      pi,
      false,
    );

    // Outer line
    arcTo(
      Rect.fromCircle(
        center: center,
        radius: radius + halfStroke,
      ),
      startAngle,
      sweepAngle,
      false,
    );

    // End cap
    arcTo(
      Rect.fromCircle(
        center: endCap,
        radius: halfStroke,
      ),
      startAngle + sweepAngle,
      pi,
      false,
    );

    // Inner line
    arcTo(
      Rect.fromCircle(
        center: center,
        radius: radius - halfStroke,
      ),
      startAngle + sweepAngle,
      -sweepAngle,
      false,
    );

    // Close path
    close();
  }
}
