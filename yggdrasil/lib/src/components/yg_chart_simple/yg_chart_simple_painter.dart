import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_chart/models/_models.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_colors.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_paths.dart';

/// Paints the line and band series of a [YgChartSimple].
///
/// Without axes the whole canvas is the plot: the data spans the full width
/// edge to edge and is drawn against the vertical range of [resolveRange],
/// inset by a small padding at the top and bottom, see
/// [verticalPaddingFraction]. Lines and bands are drawn with the same look
/// as on a [YgChart].
class YgChartSimplePainter extends CustomPainter {
  YgChartSimplePainter({
    required this.series,
    required this.referenceColor,
    this.referenceValue,
    this.rangeSnap,
  });

  /// Fraction of the canvas height kept free above and below the data, so
  /// the outermost values do not touch the edges of the canvas.
  static const double verticalPaddingFraction = 0.05;

  static const double _lineWidth = 2.0;
  static const double _lineCurveHalfLength = 6.0;
  static const double _referenceLineWidth = 1.0;

  /// The series to paint, with their colors already resolved.
  final List<YgChartSeries> series;

  /// Value marked with a dashed horizontal line, for example a thermostat
  /// setpoint on a temperature chart. When null no line is drawn.
  final double? referenceValue;

  /// Color of the dashed line marking [referenceValue], also the fallback
  /// for series without a resolved color.
  final Color referenceColor;

  /// Snaps the bounds of the vertical scale outwards to multiples of this
  /// value instead of hugging the data, see [YgChartSimple.rangeSnap].
  final double? rangeSnap;

  /// Lower bound of the vertical scale, computed from the data.
  double _minValue = 0.0;

  /// Upper bound of the vertical scale, computed from the data.
  double _maxValue = 0.0;

  @override
  void paint(Canvas canvas, Size size) {
    final ({double min, double max})? range = resolveRange(
      series: series,
      referenceValue: referenceValue,
      rangeSnap: rangeSnap,
    );
    if (range == null) {
      return;
    }
    _minValue = range.min;
    _maxValue = range.max;

    _paintReferenceLine(canvas, size);

    // Bands below the plain lines, so a line stays readable when it crosses
    // a band, matching the paint order of the full chart.
    for (final YgChartSeries bandSeries in series) {
      if (bandSeries.type == YgChartSeriesType.band) {
        _paintBand(canvas, size, bandSeries);
      }
    }

    for (final YgChartSeries lineSeries in series) {
      if (lineSeries.type == YgChartSeriesType.line) {
        _paintLine(canvas, size, lineSeries);
      }
    }
  }

  @override
  bool shouldRepaint(YgChartSimplePainter oldDelegate) {
    return oldDelegate.series != series ||
        oldDelegate.referenceValue != referenceValue ||
        oldDelegate.referenceColor != referenceColor ||
        oldDelegate.rangeSnap != rangeSnap;
  }

  /// Resolves the vertical scale from the data and [referenceValue].
  ///
  /// With [rangeSnap] set, the bounds are rounded outwards to multiples of
  /// it instead of hugging the data, mirroring the snapping of a zoomed-in
  /// [YgChart] axis. Returns null when there is no finite value to scale
  /// against, in which case nothing is painted.
  @visibleForTesting
  static ({double min, double max})? resolveRange({
    required List<YgChartSeries> series,
    required double? referenceValue,
    required double? rangeSnap,
  }) {
    double minValue = double.infinity;
    double maxValue = double.negativeInfinity;

    void include(double value) {
      if (value.isNaN) {
        return;
      }
      minValue = math.min(minValue, value);
      maxValue = math.max(maxValue, value);
    }

    for (final YgChartSeries singleSeries in series) {
      singleSeries.values.forEach(include);
      singleSeries.lowerValues?.forEach(include);
      singleSeries.upperValues?.forEach(include);
    }

    if (referenceValue != null) {
      include(referenceValue);
    }

    if (minValue > maxValue) {
      return null;
    }

    final double dataMin = minValue;

    if (minValue == maxValue) {
      // Flat data has no range of its own; give it one so the flat line is
      // painted centered instead of dividing by zero.
      minValue -= 0.5;
      maxValue += 0.5;
    }

    if (rangeSnap != null && rangeSnap > 0.0) {
      minValue = (minValue / rangeSnap).floorToDouble() * rangeSnap;
      if (minValue < 0.0 && dataMin >= 0.0) {
        // The data itself is not negative, so extending the range below
        // zero would be misleading.
        minValue = 0.0;
      }

      maxValue = (maxValue / rangeSnap).ceilToDouble() * rangeSnap;
      if (maxValue <= minValue) {
        maxValue = minValue + rangeSnap;
      }
    }

    return (min: minValue, max: maxValue);
  }

  double _yFor(double value, Size size) {
    final double padding = size.height * verticalPaddingFraction;
    final double fraction = (value - _minValue) / (_maxValue - _minValue);

    return padding + (1.0 - fraction) * (size.height - 2.0 * padding);
  }

  /// The x position of the value at [index], spanning the full canvas width
  /// edge to edge.
  double _xFor(int index, Size size, int valueCount) {
    if (valueCount <= 1) {
      return size.width / 2.0;
    }

    return size.width * index / (valueCount - 1);
  }

  void _paintReferenceLine(Canvas canvas, Size size) {
    final double? referenceValue = this.referenceValue;
    if (referenceValue == null) {
      return;
    }

    final double y = _yFor(referenceValue, size);
    final Paint referencePaint = Paint()
      ..color = referenceColor
      ..strokeWidth = _referenceLineWidth
      ..style = PaintingStyle.stroke;

    final Path dashedLine = dashPath(
      Path()
        ..moveTo(0.0, y)
        ..lineTo(size.width, y),
      dashArray: CircularIntervalList<double>(const <double>[4.0, 4.0]),
    );

    canvas.drawPath(dashedLine, referencePaint);
  }

  void _paintLine(Canvas canvas, Size size, YgChartSeries lineSeries) {
    final Paint linePaint = Paint()
      ..color = lineSeries.color ?? referenceColor
      ..strokeWidth = _lineWidth
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final List<double> values = lineSeries.values;

    // NaN values are gaps; every gap-free run is drawn as its own path
    // instead of connecting the points on either side of a gap.
    List<Offset> runPoints = <Offset>[];
    for (int i = 0; i <= values.length; i++) {
      if (i < values.length && !values[i].isNaN) {
        runPoints.add(Offset(_xFor(i, size, values.length), _yFor(values[i], size)));
        continue;
      }

      if (runPoints.isEmpty) {
        continue;
      }

      _paintLineRun(canvas, runPoints, linePaint);
      runPoints = <Offset>[];
    }
  }

  /// Paints one gap-free run of a line series.
  void _paintLineRun(Canvas canvas, List<Offset> points, Paint linePaint) {
    if (points.length == 1) {
      // A single sample between gaps renders as a dot.
      canvas.drawCircle(points.first, _lineWidth, linePaint..style = PaintingStyle.fill);
      linePaint.style = PaintingStyle.stroke;

      return;
    }

    canvas.drawPath(YgChartPaths.linePath(points, curveHalfLength: _lineCurveHalfLength), linePaint);
  }

  void _paintBand(Canvas canvas, Size size, YgChartSeries bandSeries) {
    final List<double> centerValues = bandSeries.values;
    final List<double> lowerValues = bandSeries.lowerValues ?? const <double>[];
    final List<double> upperValues = bandSeries.upperValues ?? const <double>[];

    final Color color = bandSeries.color ?? referenceColor;
    final Color fillColor = color.withValues(alpha: color.a * YgChartColors.areaFillOpacity);

    // NaN values are gaps; every gap-free run is drawn as its own band.
    List<Offset> centerRun = <Offset>[];
    List<Offset> lowerRun = <Offset>[];
    List<Offset> upperRun = <Offset>[];
    for (int i = 0; i <= centerValues.length; i++) {
      final bool valid =
          i < centerValues.length &&
          i < lowerValues.length &&
          i < upperValues.length &&
          !centerValues[i].isNaN &&
          !lowerValues[i].isNaN &&
          !upperValues[i].isNaN;

      if (valid) {
        final double x = _xFor(i, size, centerValues.length);
        centerRun.add(Offset(x, _yFor(centerValues[i], size)));
        lowerRun.add(Offset(x, _yFor(lowerValues[i], size)));
        upperRun.add(Offset(x, _yFor(upperValues[i], size)));
        continue;
      }

      if (centerRun.isEmpty) {
        continue;
      }

      _paintBandRun(
        canvas: canvas,
        centerPoints: centerRun,
        lowerPoints: lowerRun,
        upperPoints: upperRun,
        fillColor: fillColor,
        lineColor: color,
      );
      centerRun = <Offset>[];
      lowerRun = <Offset>[];
      upperRun = <Offset>[];
    }
  }

  /// Paints one gap-free run of a band series.
  void _paintBandRun({
    required Canvas canvas,
    required List<Offset> centerPoints,
    required List<Offset> lowerPoints,
    required List<Offset> upperPoints,
    required Color fillColor,
    required Color lineColor,
  }) {
    if (centerPoints.length == 1) {
      // A single column renders as a dot on a vertical band segment.
      final Paint segmentPaint = Paint()
        ..color = fillColor
        ..strokeWidth = 2.0 * _lineWidth;
      canvas.drawLine(upperPoints.first, lowerPoints.first, segmentPaint);
      canvas.drawCircle(centerPoints.first, _lineWidth, Paint()..color = lineColor);

      return;
    }

    final Paint fillPaint = Paint()..color = fillColor;
    canvas.drawPath(YgChartPaths.bandPath(upperPoints, lowerPoints), fillPaint);

    // Unlike the line series the band is drawn raw: straight segments with
    // sharp corners and ends, matching the full chart.
    final Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = _lineWidth
      ..style = PaintingStyle.stroke;
    canvas.drawPath(YgChartPaths.straightPath(centerPoints), linePaint);
  }
}
