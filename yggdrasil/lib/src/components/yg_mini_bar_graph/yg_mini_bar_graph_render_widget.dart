import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:yggdrasil/src/components/yg_mini_bar_graph/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_mini_bar_graph/models/_models.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgMiniBarGraphRenderWidget extends LeafRenderObjectWidget {
  const YgMiniBarGraphRenderWidget({
    super.key,
    required this.values,
    required this.minBarCount,
    required this.currentBarIndex,
    required this.leadingBars,
  });

  final List<YgBarGraphBar>? values;
  final int minBarCount;
  final int currentBarIndex;
  final int leadingBars;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgMiniBarGraphRenderer(
      values: values,
      minBarCount: minBarCount,
      currentBarIndex: currentBarIndex,
      leadingBars: leadingBars,
      theme: context.miniBarGraphTheme,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgMiniBarGraphRenderer renderObject) {
    renderObject.bars = values;
    renderObject.minBarCount = minBarCount;
    renderObject.currentBarIndex = currentBarIndex;
    renderObject.leadingBars = leadingBars;
    renderObject.theme = context.miniBarGraphTheme;
  }
}

class YgMiniBarGraphRenderer extends RenderBox {
  YgMiniBarGraphRenderer({
    required List<YgBarGraphBar>? values,
    required int minBarCount,
    required int currentBarIndex,
    required int leadingBars,
    required YgMiniBarGraphTheme theme,
  })  : _bars = values,
        _minBarCount = minBarCount,
        _theme = theme,
        _currentBarIndex = currentBarIndex,
        _leadingBars = leadingBars;

  List<YgBarGraphBar>? _bars;
  List<YgBarGraphBar>? get bars => _bars;
  set bars(List<YgBarGraphBar>? newValue) {
    if (newValue != _bars) {
      _bars = newValue;
      markNeedsPaint();
    }
  }

  int _minBarCount;
  int get minBarCount => _minBarCount;
  set minBarCount(int newValue) {
    if (newValue != _minBarCount) {
      _minBarCount = newValue;
      markNeedsPaint();
    }
  }

  int _currentBarIndex;
  int get currentBarIndex => _currentBarIndex;
  set currentBarIndex(int newValue) {
    if (newValue != _currentBarIndex) {
      _currentBarIndex = newValue;
      markNeedsPaint();
    }
  }

  int _leadingBars;
  int get leadingBars => _leadingBars;
  set leadingBars(int newValue) {
    if (newValue != _leadingBars) {
      _leadingBars = newValue;
      markNeedsPaint();
    }
  }

  YgMiniBarGraphTheme _theme;
  YgMiniBarGraphTheme get theme => _theme;
  set theme(YgMiniBarGraphTheme newValue) {
    if (newValue != _theme) {
      _theme = newValue;
      markNeedsPaint();
    }
  }

  static final Paint _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 1;

  static final Paint _barPaint = Paint();

  @override
  void performLayout() {
    if (constraints.hasBoundedHeight) {
      size = constraints.biggest;
    } else {
      size = Size(
        constraints.maxWidth,
        constraints.constrainHeight(40),
      );
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    final double targetBarWidth = theme.barWidth;
    final double maxBarSpacing = theme.maxBarSpacing;
    final List<YgBarGraphBar>? bars = _bars;
    print(bars);

    final int targetBarCount = ((size.width - targetBarWidth) / (targetBarWidth + maxBarSpacing)).ceil() + 1;
    final int actualBarCount = max(minBarCount, targetBarCount);
    final double totalBarWidth = min(size.width, actualBarCount * targetBarWidth);
    final double actualBarWidth = totalBarWidth / actualBarCount;
    final double actualBarSpacing = (size.width - totalBarWidth) / (actualBarCount - 1);
    final double barOffsetInterval = actualBarWidth + actualBarSpacing;
    final double maxBarHeight = size.height - 7;
    final int barIndexOffset = _currentBarIndex - leadingBars;

    double maxValue = 0.0;
    if (bars != null) {
      final int start = max(barIndexOffset, 0);
      final num end = start + min(start + actualBarCount, bars.length - start);
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
      if (bars == null) {
        percentage = 0;
      } else if (bar == null) {
        percentage = 0.5;
      } else {
        percentage = bar.value / maxValue;
      }

      final double barHeight = max(1, maxBarHeight * percentage);
      final double barXOffset = barOffsetInterval * i;

      final Rect rect = Rect.fromLTWH(
        barXOffset + offset.dx,
        (maxBarHeight - barHeight) + offset.dy,
        actualBarWidth,
        barHeight,
      );
      final RRect rrect = _theme.barBorderRadius.toRRect(rect);

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
        final Offset arrowOffset = Offset(barXOffset, size.height - 4) + offset;
        final Path arrowPath = _getArrowPath(actualBarWidth, 4, 1).shift(arrowOffset);

        canvas.drawPath(arrowPath, _barPaint);
      }
    }
  }

  /// Draws the indicator arrow.
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
}
