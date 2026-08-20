import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_chart/models/_models.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_colors.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_data_manager.dart';

/// Paints the grid, axis labels, bars, lines and bands of a [YgChart].
///
/// The painter repaints on every tick of [animation] and reads the values to
/// render from [dataManager], which interpolates them based on the animation
/// progress.
class YgChartPainter extends CustomPainter {
  YgChartPainter({
    required this.dataManager,
    required this.animation,
    required this.xLabels,
    required this.leftUnit,
    required this.rightUnit,
    required this.axisTextStyle,
    required this.gridColor,
    required this.baselineColor,
    required this.layout,
    required this.textCache,
    this.bottomInset = 0.0,
    this.selectedIndex,
    this.selectionColor,
  }) : super(repaint: animation);

  /// Height of the row above the plot showing the axis units.
  static const double unitRowHeight = 22.0;

  /// Height of the row below the plot showing the x-axis labels.
  static const double xLabelRowHeight = 20.0;

  static const double _axisLabelPadding = 6.0;
  static const double _barGroupWidthFactor = 0.5;
  static const double _maxBarWidth = 14.0;
  static const double _stackGapHalf = 1.0;
  static const double _lineWidth = 2.0;

  /// Stepped area series get a slightly heavier line than plain line
  /// series, so the step outline holds up against its area fill.
  static const double _steppedAreaLineWidth = 3.0;

  static const double _lineCurveHalfLength = 6.0;
  static const double _xLabelSpacing = 8.0;

  final YgChartDataManager dataManager;
  final Animation<double> animation;

  /// One label per value index, drawn below the plot.
  final List<String> xLabels;

  /// Unit shown above the left axis labels.
  final String? leftUnit;

  /// Unit shown above the right axis labels.
  ///
  /// When null the right axis is not drawn at all.
  final String? rightUnit;

  final TextStyle axisTextStyle;
  final Color gridColor;
  final Color baselineColor;

  /// The geometry of the last paint, shared with the [YgChart] widget so
  /// gestures can be mapped to value indexes.
  final YgChartLayout layout;

  /// Reuses laid out text between the paints of the animation, see
  /// [YgChartTextLayoutCache].
  final YgChartTextLayoutCache textCache;

  /// Extra space kept free between the plot and the x-axis labels, for
  /// example for the event density rail.
  final double bottomInset;

  /// Index of the long pressed column, marked with a dashed vertical line.
  final int? selectedIndex;

  /// Color of the dashed line marking [selectedIndex].
  final Color? selectionColor;

  @override
  void paint(Canvas canvas, Size size) {
    dataManager.applyAnimationValue(animation.value);

    final double leftGutterWidth = _measureGutterWidth(YgChartAxis.left, leftUnit);
    final double rightGutterWidth = rightUnit != null ? _measureGutterWidth(YgChartAxis.right, rightUnit) : 0.0;

    final Rect plotRect = Rect.fromLTRB(
      leftGutterWidth + _axisLabelPadding,
      unitRowHeight,
      size.width - (rightUnit != null ? rightGutterWidth + _axisLabelPadding : 0.0),
      size.height - xLabelRowHeight - bottomInset,
    );

    layout.plotRect = plotRect;
    layout.canvasSize = size;

    if (plotRect.width <= 0.0 || plotRect.height <= 0.0) {
      return;
    }

    _paintGridAndAxisLabels(canvas, plotRect);
    _paintUnits(canvas, plotRect);
    _paintXLabels(canvas, plotRect);
    _paintSelection(canvas, plotRect);

    // Group the series by type once; paint runs on every animation frame,
    // so the per-type painters must not re-filter the series themselves.
    final List<YgChartSeries> barSeries = <YgChartSeries>[];
    final List<YgChartSeries> steppedAreaSeries = <YgChartSeries>[];
    final List<YgChartSeries> bandSeries = <YgChartSeries>[];
    final List<YgChartSeries> lineSeries = <YgChartSeries>[];
    for (final YgChartSeries series in dataManager.orderedSeries) {
      (switch (series.type) {
        YgChartSeriesType.bar => barSeries,
        YgChartSeriesType.steppedArea => steppedAreaSeries,
        YgChartSeriesType.band => bandSeries,
        YgChartSeriesType.line => lineSeries,
      }).add(series);
    }

    canvas.save();
    canvas.clipRect(plotRect.inflate(_stackGapHalf));
    _paintBars(canvas, plotRect, barSeries);
    _paintSteppedAreas(canvas, plotRect, steppedAreaSeries);
    _paintBands(canvas, plotRect, bandSeries);
    _paintLines(canvas, plotRect, lineSeries);
    canvas.restore();
  }

  /// Width needed for the value labels and unit of [axis].
  ///
  /// Measures both the previous and the new labels so the layout stays
  /// stable while they cross-fade.
  double _measureGutterWidth(YgChartAxis axis, String? unit) {
    double gutterWidth = 0.0;
    if (unit != null && unit.isNotEmpty) {
      gutterWidth = _layoutText(unit).width;
    }

    final int tickCount = dataManager.tickCount;
    for (int i = 0; i < tickCount; i++) {
      final double fraction = i / (tickCount - 1);
      gutterWidth = math.max(
        gutterWidth,
        _layoutText(_axisLabelAt(dataManager, axis, fraction, previous: true)).width,
      );
      gutterWidth = math.max(
        gutterWidth,
        _layoutText(_axisLabelAt(dataManager, axis, fraction, previous: false)).width,
      );
    }

    return gutterWidth;
  }

  @override
  bool shouldRepaint(covariant YgChartPainter oldDelegate) {
    // Data and animation changes repaint through the repaint listenable
    // (the data manager only mutates when an animation is started), so this
    // only gates repaints caused by widget rebuilds.
    return oldDelegate.textCache != textCache ||
        oldDelegate.dataManager != dataManager ||
        oldDelegate.animation != animation ||
        !listEquals(oldDelegate.xLabels, xLabels) ||
        oldDelegate.leftUnit != leftUnit ||
        oldDelegate.rightUnit != rightUnit ||
        oldDelegate.axisTextStyle != axisTextStyle ||
        oldDelegate.gridColor != gridColor ||
        oldDelegate.baselineColor != baselineColor ||
        oldDelegate.layout != layout ||
        oldDelegate.bottomInset != bottomInset ||
        oldDelegate.selectedIndex != selectedIndex ||
        oldDelegate.selectionColor != selectionColor;
  }

  void _paintGridAndAxisLabels(Canvas canvas, Rect plotRect) {
    final Paint gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1.0;

    final int tickCount = dataManager.tickCount;
    for (int i = 0; i < tickCount; i++) {
      final double fraction = i / (tickCount - 1);
      final double y = plotRect.bottom - fraction * plotRect.height;

      canvas.drawLine(
        Offset(plotRect.left, y),
        Offset(plotRect.right, y),
        gridPaint,
      );

      _paintTickLabel(
        canvas,
        axis: YgChartAxis.left,
        fraction: fraction,
        anchorX: plotRect.left - _axisLabelPadding,
        y: y,
        alignRight: true,
      );

      if (rightUnit != null) {
        _paintTickLabel(
          canvas,
          axis: YgChartAxis.right,
          fraction: fraction,
          anchorX: plotRect.right + _axisLabelPadding,
          y: y,
          alignRight: false,
        );
      }
    }

    // The zero line doubles as the baseline the bars grow from, so it is
    // slightly stronger than the other gridlines. The zero-anchored axes
    // share the zero height by construction, see YgChartDataManager; the
    // baseline follows whichever shown axis still contains zero, so it does
    // not disappear when only the other axis zooms in on its data.
    final YgChartAxis? baselineAxis = _baselineAxis();
    if (baselineAxis != null) {
      final Paint baselinePaint = Paint()
        ..color = baselineColor
        ..strokeWidth = 1.0;
      final double zeroY = _yFor(0.0, baselineAxis, plotRect);
      canvas.drawLine(
        Offset(plotRect.left, zeroY),
        Offset(plotRect.right, zeroY),
        baselinePaint,
      );
    }
  }

  /// The axis the zero baseline is drawn against, or null when no shown
  /// axis contains zero.
  YgChartAxis? _baselineAxis() {
    for (final YgChartAxis axis in YgChartAxis.values) {
      if (axis == YgChartAxis.right && rightUnit == null) {
        continue;
      }

      if (dataManager.currentMinOf(axis) <= 0.0 && dataManager.currentMaxOf(axis) >= 0.0) {
        return axis;
      }
    }

    return null;
  }

  void _paintUnits(Canvas canvas, Rect plotRect) {
    final String? leftUnit = this.leftUnit;
    if (leftUnit != null && leftUnit.isNotEmpty) {
      final TextPainter unitPainter = _layoutText(leftUnit);
      unitPainter.paint(
        canvas,
        Offset(plotRect.left - _axisLabelPadding - unitPainter.width, 0.0),
      );
    }

    final String? rightUnit = this.rightUnit;
    if (rightUnit != null && rightUnit.isNotEmpty) {
      final TextPainter unitPainter = _layoutText(rightUnit);
      unitPainter.paint(
        canvas,
        Offset(plotRect.right + _axisLabelPadding, 0.0),
      );
    }
  }

  void _paintXLabels(Canvas canvas, Rect plotRect) {
    if (xLabels.isEmpty) {
      return;
    }

    final double slotWidth = plotRect.width / xLabels.length;

    final List<TextPainter> labelPainters = <TextPainter>[];
    double maxLabelWidth = 0.0;
    for (final String label in xLabels) {
      final TextPainter labelPainter = _layoutText(label);
      labelPainters.add(labelPainter);
      maxLabelWidth = math.max(maxLabelWidth, labelPainter.width);
    }

    // Only draw every n-th label when there is not enough room for all.
    final int showEvery = math.max(1, ((maxLabelWidth + _xLabelSpacing) / slotWidth).ceil());

    for (int i = 0; i < xLabels.length; i += showEvery) {
      final TextPainter labelPainter = labelPainters[i];
      final double x = plotRect.left + (i + 0.5) * slotWidth - labelPainter.width / 2.0;

      labelPainter.paint(
        canvas,
        Offset(x, plotRect.bottom + bottomInset + (xLabelRowHeight - labelPainter.height) / 2.0),
      );
    }
  }

  void _paintBars(Canvas canvas, Rect plotRect, List<YgChartSeries> barSeries) {
    if (barSeries.isEmpty || dataManager.valueCount == 0) {
      return;
    }

    // Bars stack per axis. When both axes have bar series, the two stacks
    // are drawn side by side within the slot of the index.
    final List<YgChartAxis> barAxes = <YgChartAxis>[];
    for (final YgChartSeries series in barSeries) {
      if (!barAxes.contains(series.axis)) {
        barAxes.add(series.axis);
      }
    }

    // The stacking order per axis does not change between the indexes.
    final Map<YgChartAxis, List<YgChartSeries>> seriesPerAxis = <YgChartAxis, List<YgChartSeries>>{
      for (final YgChartAxis axis in barAxes)
        axis: barSeries.where((YgChartSeries series) => series.axis == axis).toList(),
    };

    final double slotWidth = plotRect.width / dataManager.valueCount;
    final double groupWidth = math.min(
      slotWidth * _barGroupWidthFactor,
      _maxBarWidth * barAxes.length,
    );
    final double barWidth = groupWidth / barAxes.length;
    final Paint barPaint = Paint();

    for (int index = 0; index < dataManager.valueCount; index++) {
      for (int axisIndex = 0; axisIndex < barAxes.length; axisIndex++) {
        final YgChartAxis axis = barAxes[axisIndex];
        final double barLeft =
            plotRect.left + index * slotWidth + (slotWidth - groupWidth) / 2.0 + axisIndex * barWidth;

        _paintBarStack(
          canvas: canvas,
          plotRect: plotRect,
          barPaint: barPaint,
          barSeries: seriesPerAxis[axis]!,
          axis: axis,
          index: index,
          barLeft: barLeft,
          barWidth: barWidth,
        );
      }
    }
  }

  void _paintBarStack({
    required Canvas canvas,
    required Rect plotRect,
    required Paint barPaint,
    required List<YgChartSeries> barSeries,
    required YgChartAxis axis,
    required int index,
    required double barLeft,
    required double barWidth,
  }) {
    final List<(Rect, Color)> positiveSegments = <(Rect, Color)>[];
    final List<(Rect, Color)> negativeSegments = <(Rect, Color)>[];
    double positiveBase = 0.0;
    double negativeBase = 0.0;

    for (final YgChartSeries series in barSeries) {
      final double value = dataManager.currentValuesOf(series.id)[index];
      if (value.isNaN || value == 0.0) {
        continue;
      }

      final Color color = series.color ?? baselineColor;
      if (value > 0.0) {
        final double topY = _yFor(positiveBase + value, axis, plotRect);
        final double bottomY = _yFor(positiveBase, axis, plotRect);
        positiveSegments.add((Rect.fromLTRB(barLeft, topY, barLeft + barWidth, bottomY), color));
        positiveBase += value;
      } else {
        final double topY = _yFor(negativeBase, axis, plotRect);
        final double bottomY = _yFor(negativeBase + value, axis, plotRect);
        negativeSegments.add((Rect.fromLTRB(barLeft, topY, barLeft + barWidth, bottomY), color));
        negativeBase += value;
      }
    }

    _paintSegments(canvas, barPaint, positiveSegments, roundedSide: VerticalDirection.up);
    _paintSegments(canvas, barPaint, negativeSegments, roundedSide: VerticalDirection.down);
  }

  /// Paints one stack of bar segments.
  ///
  /// Every segment is drawn as a fully rounded pill and adjacent segments
  /// are separated by a small gap, so stacked series stay distinguishable.
  void _paintSegments(
    Canvas canvas,
    Paint barPaint,
    List<(Rect, Color)> segments, {
    required VerticalDirection roundedSide,
  }) {
    for (int i = 0; i < segments.length; i++) {
      final (Rect rawRect, Color color) = segments[i];
      final bool isOutermost = i == segments.length - 1;

      Rect rect = rawRect;
      if (rect.height > 2.0 * _stackGapHalf + 1.0) {
        // Inset the edges shared with a neighbouring segment.
        final bool insetTop = roundedSide == VerticalDirection.up ? !isOutermost : i > 0;
        final bool insetBottom = roundedSide == VerticalDirection.up ? i > 0 : !isOutermost;
        rect = Rect.fromLTRB(
          rect.left,
          rect.top + (insetTop ? _stackGapHalf : 0.0),
          rect.right,
          rect.bottom - (insetBottom ? _stackGapHalf : 0.0),
        );
      }

      final Radius radius = Radius.circular(math.min(rect.width, rect.height) / 2.0);
      final RRect segment = RRect.fromRectAndRadius(rect, radius);

      barPaint.color = color;
      canvas.drawRRect(segment, barPaint);
    }
  }

  /// Paints the stepped area series: a stepped line resembling bars with
  /// the area down to the zero line filled translucently.
  ///
  /// Painted above the bars and below the bands and lines.
  void _paintSteppedAreas(Canvas canvas, Rect plotRect, List<YgChartSeries> steppedSeries) {
    if (steppedSeries.isEmpty || dataManager.valueCount == 0) {
      return;
    }

    final double slotWidth = plotRect.width / dataManager.valueCount;
    final Paint fillPaint = Paint();
    // Like the band line the steps are drawn raw: sharp corners and ends.
    final Paint linePaint = Paint()
      ..strokeWidth = _steppedAreaLineWidth
      ..style = PaintingStyle.stroke;

    for (final YgChartSeries series in steppedSeries) {
      final double opacity = dataManager.opacityOf(series.id);
      if (opacity <= 0.0) {
        continue;
      }

      final List<double> values = dataManager.currentValuesOf(series.id);
      final Color color = series.color ?? baselineColor;
      fillPaint.color = color.withValues(alpha: color.a * YgChartColors.areaFillOpacity * opacity);
      linePaint.color = _fadedColor(color, opacity);

      final double baselineY = _yFor(0.0, series.axis, plotRect);

      // NaN values split the series into independently drawn runs.
      int runStart = -1;
      for (int i = 0; i <= dataManager.valueCount; i++) {
        final bool valid = i < dataManager.valueCount && !values[i].isNaN;
        if (valid && runStart < 0) {
          runStart = i;
        } else if (!valid && runStart >= 0) {
          _paintSteppedAreaRun(
            canvas: canvas,
            plotRect: plotRect,
            slotWidth: slotWidth,
            values: values,
            axis: series.axis,
            from: runStart,
            to: i - 1,
            baselineY: baselineY,
            fillPaint: fillPaint,
            linePaint: linePaint,
          );
          runStart = -1;
        }
      }
    }
  }

  /// Paints one gapless run of a stepped area series.
  ///
  /// Every value holds over the full width of its slot and consecutive
  /// values are connected with vertical segments, giving the bar-like step
  /// look.
  void _paintSteppedAreaRun({
    required Canvas canvas,
    required Rect plotRect,
    required double slotWidth,
    required List<double> values,
    required YgChartAxis axis,
    required int from,
    required int to,
    required double baselineY,
    required Paint fillPaint,
    required Paint linePaint,
  }) {
    final Path outline = Path()..moveTo(plotRect.left + from * slotWidth, _yFor(values[from], axis, plotRect));

    for (int i = from; i <= to; i++) {
      final double y = _yFor(values[i], axis, plotRect);
      if (i > from) {
        // Vertical connector at the slot boundary.
        outline.lineTo(plotRect.left + i * slotWidth, y);
      }
      outline.lineTo(plotRect.left + (i + 1) * slotWidth, y);
    }

    final Path fill = Path.from(outline)
      ..lineTo(plotRect.left + (to + 1) * slotWidth, baselineY)
      ..lineTo(plotRect.left + from * slotWidth, baselineY)
      ..close();

    canvas.drawPath(fill, fillPaint);
    canvas.drawPath(outline, linePaint);
  }

  /// Paints the band series: a translucent area between the lower and upper
  /// bounds with the center line drawn on top.
  ///
  /// Bands are painted above the bars and below the plain line series, so a
  /// line stays readable when it crosses a band.
  void _paintBands(Canvas canvas, Rect plotRect, List<YgChartSeries> bandSeries) {
    if (bandSeries.isEmpty || dataManager.valueCount == 0) {
      return;
    }

    final double slotWidth = plotRect.width / dataManager.valueCount;

    for (final YgChartSeries series in bandSeries) {
      final double opacity = dataManager.opacityOf(series.id);
      if (opacity <= 0.0) {
        continue;
      }

      final List<double> centerValues = dataManager.currentValuesOf(series.id);
      final List<double> lowerValues = dataManager.currentLowerValuesOf(series.id);
      final List<double> upperValues = dataManager.currentUpperValuesOf(series.id);

      final List<Offset> centerPoints = <Offset>[];
      final List<Offset> lowerPoints = <Offset>[];
      final List<Offset> upperPoints = <Offset>[];

      for (int i = 0; i < dataManager.valueCount; i++) {
        if (centerValues[i].isNaN || lowerValues[i].isNaN || upperValues[i].isNaN) {
          continue;
        }

        final double x = plotRect.left + (i + 0.5) * slotWidth;
        centerPoints.add(Offset(x, _yFor(centerValues[i], series.axis, plotRect)));
        lowerPoints.add(Offset(x, _yFor(lowerValues[i], series.axis, plotRect)));
        upperPoints.add(Offset(x, _yFor(upperValues[i], series.axis, plotRect)));
      }

      if (centerPoints.isEmpty) {
        continue;
      }

      final Color color = series.color ?? baselineColor;
      final Color fillColor = color.withValues(alpha: color.a * YgChartColors.areaFillOpacity * opacity);
      final Color lineColor = _fadedColor(color, opacity);

      if (centerPoints.length == 1) {
        // A single column renders as a dot on a vertical band segment.
        final Paint segmentPaint = Paint()
          ..color = fillColor
          ..strokeWidth = 2.0 * _lineWidth;
        canvas.drawLine(upperPoints.first, lowerPoints.first, segmentPaint);
        canvas.drawCircle(centerPoints.first, _lineWidth, Paint()..color = lineColor);
        continue;
      }

      final Paint fillPaint = Paint()..color = fillColor;
      canvas.drawPath(_buildBandPath(upperPoints, lowerPoints), fillPaint);

      // Unlike the line series the band is drawn raw: straight segments
      // with sharp corners and ends.
      final Paint linePaint = Paint()
        ..color = lineColor
        ..strokeWidth = _lineWidth
        ..style = PaintingStyle.stroke;
      canvas.drawPath(_buildStraightPath(centerPoints), linePaint);
    }
  }

  void _paintLines(Canvas canvas, Rect plotRect, List<YgChartSeries> lineSeries) {
    if (lineSeries.isEmpty || dataManager.valueCount == 0) {
      return;
    }

    final double slotWidth = plotRect.width / dataManager.valueCount;

    for (final YgChartSeries series in lineSeries) {
      final double opacity = dataManager.opacityOf(series.id);
      if (opacity <= 0.0) {
        continue;
      }

      final List<double> values = dataManager.currentValuesOf(series.id);
      final List<Offset> points = <Offset>[];

      for (int i = 0; i < dataManager.valueCount; i++) {
        final double value = values[i];
        if (value.isNaN) {
          continue;
        }

        points.add(
          Offset(
            plotRect.left + (i + 0.5) * slotWidth,
            _yFor(value, series.axis, plotRect),
          ),
        );
      }

      if (points.isEmpty) {
        continue;
      }

      final Color lineColor = series.color ?? baselineColor;
      final Paint linePaint = Paint()
        ..color = _fadedColor(lineColor, opacity)
        ..strokeWidth = _lineWidth
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round;

      if (points.length == 1) {
        canvas.drawCircle(points.first, _lineWidth, linePaint..style = PaintingStyle.fill);
        continue;
      }

      canvas.drawPath(_buildLinePath(points), linePaint);
    }
  }

  /// Builds the closed outline of a band: along the upper bound, down to the
  /// lower bound and back along it to the start.
  ///
  /// Built from straight segments, matching the raw look of the band center
  /// line.
  Path _buildBandPath(List<Offset> upperPoints, List<Offset> lowerPoints) {
    return Path()..addPolygon(
      <Offset>[...upperPoints, ...lowerPoints.reversed],
      true,
    );
  }

  /// Builds a path of straight segments through [points].
  Path _buildStraightPath(List<Offset> points) {
    return Path()..addPolygon(points, false);
  }

  /// [color] with its alpha scaled by the fade [opacity] of its series.
  static Color _fadedColor(Color color, double opacity) {
    return opacity < 1.0 ? color.withValues(alpha: color.a * opacity) : color;
  }

  /// Builds a path through [points] with slightly curved corners.
  Path _buildLinePath(List<Offset> points) {
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
      final double cutLength = math.min(_lineCurveHalfLength, segmentLength / 2.0);

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

  /// Paints the value label of one gridline.
  ///
  /// Instead of morphing through intermediate numbers while the axis range
  /// animates, the old label fades out and the new one fades in, both round
  /// values.
  void _paintTickLabel(
    Canvas canvas, {
    required YgChartAxis axis,
    required double fraction,
    required double anchorX,
    required double y,
    required bool alignRight,
  }) {
    final double t = dataManager.movementProgress;
    final String finalText = _axisLabelAt(dataManager, axis, fraction, previous: false);
    final String previousText = _axisLabelAt(dataManager, axis, fraction, previous: true);

    if (previousText == finalText || t >= 1.0) {
      // The label did not change, keep it fully visible instead of fading
      // it out and back in.
      _paintFadedLabel(canvas, finalText, anchorX, y, alignRight: alignRight, opacity: 1.0);

      return;
    }

    _paintFadedLabel(canvas, finalText, anchorX, y, alignRight: alignRight, opacity: t);
    _paintFadedLabel(canvas, previousText, anchorX, y, alignRight: alignRight, opacity: 1.0 - t);
  }

  void _paintFadedLabel(
    Canvas canvas,
    String text,
    double anchorX,
    double y, {
    required bool alignRight,
    required double opacity,
  }) {
    final TextPainter labelPainter = _layoutText(text, opacity: opacity);
    labelPainter.paint(
      canvas,
      Offset(alignRight ? anchorX - labelPainter.width : anchorX, y - labelPainter.height / 2.0),
    );

    if (opacity < 1.0) {
      // Faded painters are transient (fully visible ones come from the
      // cache and are reused between frames).
      labelPainter.dispose();
    }
  }

  /// Marks the long pressed column with a dashed vertical line.
  void _paintSelection(Canvas canvas, Rect plotRect) {
    final int? selectedIndex = this.selectedIndex;
    final Color? selectionColor = this.selectionColor;
    if (selectedIndex == null || selectionColor == null || dataManager.valueCount == 0) {
      return;
    }

    final double slotWidth = plotRect.width / dataManager.valueCount;
    final double x = plotRect.left + (selectedIndex + 0.5) * slotWidth;

    final Paint selectionPaint = Paint()
      ..color = selectionColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final Path dashedLine = dashPath(
      Path()
        ..moveTo(x, plotRect.top)
        ..lineTo(x, plotRect.bottom),
      dashArray: CircularIntervalList<double>(const <double>[4.0, 4.0]),
    );

    canvas.drawPath(dashedLine, selectionPaint);
  }

  static String _axisLabelAt(
    YgChartDataManager dataManager,
    YgChartAxis axis,
    double fraction, {
    required bool previous,
  }) {
    final double minValue = previous ? dataManager.previousMinOf(axis) : dataManager.finalMinOf(axis);
    final double maxValue = previous ? dataManager.previousMaxOf(axis) : dataManager.finalMaxOf(axis);
    final int precision = previous ? dataManager.previousPrecisionOf(axis) : dataManager.precisionOf(axis);
    final double value = minValue + fraction * (maxValue - minValue);

    return _formatAxisValue(value, precision);
  }

  static String _formatAxisValue(double value, int precision) {
    // Avoid rendering '-0' for negative zero and rounding residue.
    final double safeValue = value.abs() < 0.000000001 ? 0.0 : value;

    return safeValue.toStringAsFixed(precision);
  }

  double _yFor(double value, YgChartAxis axis, Rect plotRect) {
    final double minValue = dataManager.currentMinOf(axis);
    final double maxValue = dataManager.currentMaxOf(axis);
    final double range = maxValue - minValue;
    if (range <= 0.0) {
      return plotRect.bottom;
    }

    return plotRect.bottom - ((value - minValue) / range) * plotRect.height;
  }

  TextPainter _layoutText(String text, {double opacity = 1.0}) {
    if (opacity >= 1.0) {
      return textCache.painterFor(text, axisTextStyle);
    }

    // Faded labels only exist while a label cross-fade animates, so they
    // are not worth caching per opacity step.
    final Color color = axisTextStyle.color ?? const Color(0xff000000);

    return TextPainter(
      text: TextSpan(
        text: text,
        style: axisTextStyle.copyWith(color: color.withValues(alpha: color.a * opacity)),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
  }
}

/// Reuses laid out [TextPainter]s across the paints of a [YgChart].
///
/// Text layout is the most expensive part of a chart frame and the painter
/// draws every axis and x-axis label on every animation tick, while the
/// label texts only change when the data manager retargets. Owned by the
/// chart state (like [YgChartLayout]) so the layouts survive between the
/// painter instances created by rebuilds.
class YgChartTextLayoutCache {
  YgChartTextLayoutCache();

  /// Safety cap; a chart shows far fewer distinct labels at a time, but
  /// long-running charts retarget through many label sets.
  static const int _maxEntries = 128;

  final Map<String, TextPainter> _painters = <String, TextPainter>{};
  TextStyle? _style;

  /// The painter for [text] laid out in [style], reusing a cached layout.
  TextPainter painterFor(String text, TextStyle style) {
    if (style != _style) {
      _evictAll();
      _style = style;
    } else if (_painters.length >= _maxEntries && !_painters.containsKey(text)) {
      _evictAll();
    }

    return _painters.putIfAbsent(
      text,
      () => TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr,
      )..layout(),
    );
  }

  void _evictAll() {
    for (final TextPainter painter in _painters.values) {
      painter.dispose();
    }
    _painters.clear();
  }

  void dispose() {
    _evictAll();
  }
}

/// The geometry of the last [YgChartPainter] paint.
///
/// Owned by the [YgChart] state and written by the painter, so gesture
/// positions can be mapped to value indexes without duplicating the axis
/// gutter measurement outside of the painter.
class YgChartLayout extends ChangeNotifier {
  YgChartLayout();

  Rect? _plotRect;
  Size? _canvasSize;

  bool _notifyScheduled = false;
  bool _disposed = false;

  /// The area of the canvas the data is drawn in.
  Rect? get plotRect => _plotRect;
  set plotRect(Rect? value) {
    if (_plotRect == value) {
      return;
    }

    _plotRect = value;
    _scheduleNotify();
  }

  /// The full size of the chart canvas.
  Size? get canvasSize => _canvasSize;
  set canvasSize(Size? value) {
    if (_canvasSize == value) {
      return;
    }

    _canvasSize = value;
    _scheduleNotify();
  }

  /// Notifies listeners after the current frame.
  ///
  /// The geometry is written during paint, where rebuilding listeners (for
  /// example the event marker layer) is not allowed, so the notification is
  /// deferred to the end of the frame.
  void _scheduleNotify() {
    if (_notifyScheduled) {
      return;
    }

    _notifyScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifyScheduled = false;
      if (!_disposed) {
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
