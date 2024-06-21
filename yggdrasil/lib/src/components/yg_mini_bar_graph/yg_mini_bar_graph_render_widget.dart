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

  final List<YgBarGraphBar> values;
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
    renderObject.values = values;
    renderObject.minBarCount = minBarCount;
    renderObject.currentBarIndex = currentBarIndex;
    renderObject.leadingBars = leadingBars;
    renderObject.theme = context.miniBarGraphTheme;
  }
}

class YgMiniBarGraphRenderer extends RenderBox {
  YgMiniBarGraphRenderer({
    required List<YgBarGraphBar> values,
    required int minBarCount,
    required int currentBarIndex,
    required int leadingBars,
    required YgMiniBarGraphTheme theme,
  })  : _values = values,
        _minBarCount = minBarCount,
        _theme = theme,
        _currentBarIndex = currentBarIndex,
        _leadingBars = leadingBars;

  List<YgBarGraphBar> _values;
  List<YgBarGraphBar> get values => _values;
  set values(List<YgBarGraphBar> newValue) {
    if (newValue != _values) {
      _values = newValue;
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

  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    final double targetBarWidth = theme.barWidth;
    final double maxBarSpacing = theme.maxBarSpacing;

    final int targetBarCount = ((size.width - targetBarWidth) / (targetBarWidth + maxBarSpacing)).ceil() + 1;
    final int actualBarCount = max(minBarCount, targetBarCount);
    final double totalBarWidth = min(size.width, actualBarCount * targetBarWidth);
    final double actualBarWidth = totalBarWidth / actualBarCount;
    final double actualBarSpacing = (size.width - totalBarWidth) / (actualBarCount - 1);
    final double barOffsetInterval = actualBarWidth + actualBarSpacing;

    final int indexOffset = _currentBarIndex - leadingBars;

    for (int i = 0; i < actualBarCount; i++) {
      final int index = i + indexOffset;

      final YgBarGraphBar? value;
      if (index >= 0 && index < _values.length) {
        value = _values[index];
      } else {
        value = null;
      }

      final Color color;
      if (value == null) {
        color = theme.barColorNull;
      } else if (i < leadingBars) {
        color = theme.barColorDefault;
      } else {
        color = switch (value.variant) {
          BarVariant.high => theme.barColorWarning,
          BarVariant.low => theme.barColorSuccess,
          BarVariant.unknown => theme.barColorNeutral,
        };
      }

      final Offset barOffset = offset +
          Offset(
            barOffsetInterval * i,
            0,
          );

      final Size barSize = Size(actualBarWidth, size.height - 7);
      final Rect rect = barOffset & barSize;
      final Paint paint = Paint()..color = color;
      final RRect rrect = _theme.barBorderRadius.toRRect(rect);

      canvas.drawRRect(rrect, paint);
      if (value == null) {
        final CircularIntervalList<double> dashArray = CircularIntervalList<double>(<double>[5, 2.5]);

        final Paint borderPaint = Paint()
          ..color = theme.barBorderColorNull
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 1;

        final Path dashBorder = dashPath(
          Path()..addRRect(rrect),
          dashArray: dashArray,
        );

        canvas.drawPath(dashBorder, borderPaint);
      }

      if (leadingBars == i) {
        final Path arrowPath = _getArrowPath(actualBarWidth, 4, 1).shift(barOffset + Offset(0, size.height - 4));

        canvas.drawPath(arrowPath, paint);
      }
    }
  }

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
