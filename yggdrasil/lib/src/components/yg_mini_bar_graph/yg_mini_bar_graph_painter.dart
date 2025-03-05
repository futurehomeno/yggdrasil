import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:yggdrasil/src/theme/mini_bar_graph/mini_bar_graph_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgMiniBarGraphPainter extends CustomPainter {
  const YgMiniBarGraphPainter({
    required this.bars,
    required this.minBarCount,
    required this.currentBarIndex,
    required this.leadingBars,
    required this.theme,
  });

  final List<YgBarGraphBar>? bars;
  final int minBarCount;
  final int currentBarIndex;
  final int leadingBars;
  final YgMiniBarGraphTheme theme;

  static final Paint _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 1;

  static final Paint _barPaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final double targetBarWidth = theme.barWidth;
    final double maxBarSpacing = theme.maxBarSpacing;
    final double indicatorHeight = theme.indicatorSize;
    final List<YgBarGraphBar>? bars = this.bars;

    final int targetBarCount = ((size.width - targetBarWidth) / (targetBarWidth + maxBarSpacing)).ceil() + 1;
    final int actualBarCount = max(minBarCount, targetBarCount);
    final double totalBarWidth = min(size.width, actualBarCount * targetBarWidth);
    final double actualBarWidth = totalBarWidth / actualBarCount;
    final double actualBarSpacing = (size.width - totalBarWidth) / (actualBarCount - 1);
    final double barIntervalOffset = actualBarWidth + actualBarSpacing;
    final double maxBarHeight = size.height - theme.barIndicatorSpacing - indicatorHeight;
    final int barIndexOffset = currentBarIndex - leadingBars;

    double maxValue = 0.0;
    if (bars != null) {
      final int start = max(barIndexOffset, 0);
      final num end = min(barIndexOffset + actualBarCount, bars.length);
      for (int i = start; i < end; i++) {
        final YgBarGraphBar value = bars[i];

        if (value.value > maxValue) {
          maxValue = value.value;
        }
      }
    }

    for (int i = 0; i < actualBarCount; i++) {
      final int index = i + barIndexOffset;

      final YgBarGraphBar? bar;
      if (bars != null && index >= 0 && index < bars.length) {
        bar = bars[index];
      } else {
        bar = null;
      }

      final Color color;
      if (bars == null) {
        color = theme.barColorDefault;
      } else if (bar == null) {
        color = theme.barColorNull;
      } else if (i < leadingBars) {
        color = theme.barColorDefault;
      } else {
        color = switch (bar.variant) {
          BarVariant.high => theme.barColorWarning,
          BarVariant.low => theme.barColorSuccess,
          null => theme.barColorNeutral,
        };
      }

      final double percentage;
      if (bars == null || maxValue == 0) {
        percentage = 0;
      } else if (bar == null) {
        percentage = 0.5;
      } else {
        percentage = bar.value / maxValue;
      }

      final double barHeight = max(1, maxBarHeight * percentage);
      final double barXOffset = barIntervalOffset * i;

      final Rect rect = Rect.fromLTWH(
        barXOffset,
        (maxBarHeight - barHeight),
        actualBarWidth,
        barHeight,
      );
      final RRect rrect = theme.barBorderRadius.toRRect(rect);

      _barPaint.color = color;
      canvas.drawRRect(rrect, _barPaint);
      if (bars != null && bar == null) {
        final CircularIntervalList<double> dashArray = CircularIntervalList<double>(<double>[5, 2.5]);
        _borderPaint.color = theme.barBorderColorNull;

        final Path dashBorder = dashPath(
          Path()..addRRect(rrect),
          dashArray: dashArray,
        );

        canvas.drawPath(dashBorder, _borderPaint);
      }

      if (bars != null && leadingBars == i) {
        final Offset arrowOffset = Offset(barXOffset, size.height - indicatorHeight);
        final Path arrowPath = _getArrowPath(actualBarWidth, indicatorHeight, 1).shift(arrowOffset);

        canvas.drawPath(arrowPath, _barPaint);
      }
    }
  }

  /// Draws the indicator arrow to a path and returns it.
  Path _getArrowPath(double width, double height, double cornerRadius) {
    final Path path = Path();
    final double actualRadius = min(width, min(height, cornerRadius));

    // Create the 3 points in the arrow inset by the corner radius.
    final Offset topPoint = Offset(width / 2, actualRadius);
    final Offset rightPoint = Offset(width - actualRadius, height - actualRadius);
    final Offset leftPoint = Offset(actualRadius, height - actualRadius);

    // Calculate angles for the arcs
    final double angleAtTop = atan2(width / 2, height);
    final double angleAtSides = atan2(height, (width / 2));

    // Draw arc at the top point of the arrow
    path.arcTo(
      Rect.fromCircle(
        center: topPoint,
        radius: actualRadius,
      ),
      angleAtTop + pi,
      pi - (angleAtTop * 2),
      false,
    );

    // Draw arc at the right point of the arrow
    path.arcTo(
      Rect.fromCircle(
        center: rightPoint,
        radius: actualRadius,
      ),
      angleAtSides - (pi / 2),
      pi - angleAtSides,
      false,
    );

    // Draw arc at the left point of the arrow
    path.arcTo(
      Rect.fromCircle(
        center: leftPoint,
        radius: actualRadius,
      ),
      pi / 2,
      pi - angleAtSides,
      false,
    );

    return path;
  }

  @override
  bool shouldRepaint(covariant YgMiniBarGraphPainter oldDelegate) {
    return oldDelegate.bars != bars ||
        oldDelegate.minBarCount != minBarCount ||
        oldDelegate.currentBarIndex != currentBarIndex ||
        oldDelegate.leadingBars != leadingBars ||
        oldDelegate.theme != theme;
  }
}
