import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:yggdrasil/src/components/yg_chart/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_chart/models/_models.dart';

/// Tracks the values and axis ranges shown on a [YgChart] so that changes to
/// both can be animated.
///
/// For every series the manager keeps a start, current and final list of
/// values. [updateData] diffs the new data against the final values and
/// [applyAnimationValue] interpolates the current values between start and
/// final. Newly added series animate in from zero, series that are removed
/// (or hidden through the legend) animate out to zero and are pruned once
/// they get there.
///
/// The axis ranges are tracked separately from the values, based on the final
/// values, so the axis scale animates directly to its new range instead of
/// following the largest intermediate value.
class YgChartDataManager {
  YgChartDataManager();

  static const int _maxPrecision = 3;

  // Timing of a staged animation, as fractions of the total duration. When a
  // line series is toggled, running the fade and the axis rescale at the
  // same time makes the whole chart move at once (and the fading line drift
  // with the rescaling axis), so they are sequenced instead: first the line
  // fades while everything else stands still, then the axis and values move.
  static const double _fadeOutEnd = 0.3;
  static const double _stagedMovementBegin = 0.35;
  static const double _fadeInBegin = 0.55;

  int _valueCount = 0;
  int _tickCount = 3;

  /// Insertion order doubles as the bar stacking / paint order.
  final Map<String, YgChartSeries> _seriesById = <String, YgChartSeries>{};
  final Map<String, List<double>> _startValues = <String, List<double>>{};
  final Map<String, List<double>> _currentValues = <String, List<double>>{};
  final Map<String, List<double>> _finalValues = <String, List<double>>{};

  // Line series appear and disappear by fading instead of collapsing to the
  // zero line, so their opacity is animated just like the values. Bar series
  // keep an opacity of 1.0 and grow from / shrink to the baseline instead.
  final Map<String, double> _startOpacity = <String, double>{};
  final Map<String, double> _currentOpacity = <String, double>{};
  final Map<String, double> _finalOpacity = <String, double>{};

  Set<String> _visibleIds = <String>{};

  /// Whether the running animation staggers fading and movement, see the
  /// timing constants above. Set when an update changes series visibility.
  bool _staged = false;

  double _movementProgress = 1.0;

  final _YgChartAxisState _leftAxis = _YgChartAxisState();
  final _YgChartAxisState _rightAxis = _YgChartAxisState();

  /// Number of values shown per series.
  int get valueCount => _valueCount;

  /// Number of value steps (gridlines) shown on the axes.
  int get tickCount => _tickCount;

  /// All currently tracked series, including ones animating out.
  ///
  /// Ordered as passed to [updateData], which is also the stacking order of
  /// bar series.
  List<YgChartSeries> get orderedSeries => _seriesById.values.toList();

  /// Current (possibly mid-animation) values of the series with [id].
  List<double> currentValuesOf(String id) => _currentValues[id]!;

  /// Current (possibly mid-animation) opacity of the series with [id].
  ///
  /// Only line series fade, bar series always report 1.0.
  double opacityOf(String id) => _currentOpacity[id] ?? 1.0;

  /// Eased progress of the movement channel of the running animation.
  ///
  /// Values and axis ranges move along this channel; the axis label
  /// cross-fade should follow it as well.
  double get movementProgress => _movementProgress;

  /// Current (possibly mid-animation) lowest value of [axis].
  double currentMinOf(YgChartAxis axis) => _axisStateOf(axis).currentMin;

  /// Current (possibly mid-animation) highest value of [axis].
  double currentMaxOf(YgChartAxis axis) => _axisStateOf(axis).currentMax;

  /// Lowest value of [axis] once the running animation completes.
  double finalMinOf(YgChartAxis axis) => _axisStateOf(axis).finalMin;

  /// Highest value of [axis] once the running animation completes.
  double finalMaxOf(YgChartAxis axis) => _axisStateOf(axis).finalMax;

  /// Number of decimals needed to render the labels of [axis].
  int precisionOf(YgChartAxis axis) => _axisStateOf(axis).precision;

  /// Lowest value of [axis] before the current animation started.
  ///
  /// Together with [previousMaxOf] and [previousPrecisionOf] this describes
  /// the labels the axis showed before the running animation, so they can be
  /// cross-faded to the new ones.
  double previousMinOf(YgChartAxis axis) => _axisStateOf(axis).labelStartMin;

  /// Highest value of [axis] before the current animation started.
  double previousMaxOf(YgChartAxis axis) => _axisStateOf(axis).labelStartMax;

  /// Number of decimals of the [axis] labels before the current animation.
  int previousPrecisionOf(YgChartAxis axis) => _axisStateOf(axis).labelStartPrecision;

  /// Updates the tracked series and axis targets.
  ///
  /// Returns whether anything changed and an animation should be started.
  bool updateData(
    List<YgChartSeries> visibleSeries, {
    required int valueCount,
    required int tickCount,
  }) {
    bool changed = false;
    bool visibilityChanged = false;

    if (tickCount != _tickCount) {
      _tickCount = tickCount;
      changed = true;
    }

    if (valueCount != _valueCount) {
      // The x-axis resolution changed. Animating between different value
      // counts is not meaningful, so the tracked state is rebuilt from
      // scratch and the new values animate in from zero.
      _valueCount = valueCount;
      _seriesById.clear();
      _startValues.clear();
      _currentValues.clear();
      _finalValues.clear();
      _startOpacity.clear();
      _currentOpacity.clear();
      _finalOpacity.clear();
      changed = true;
    }

    _visibleIds = visibleSeries.map((YgChartSeries series) => series.id).toSet();

    for (final YgChartSeries series in visibleSeries) {
      final List<double>? finalValues = _finalValues[series.id];
      _seriesById[series.id] = series;

      if (finalValues == null) {
        final List<double> newValues = List<double>.generate(
          _valueCount,
          (int index) => _valueAt(series, index),
        );

        if (series.type == YgChartSeriesType.line) {
          // Lines fade in at their actual values.
          _startValues[series.id] = List<double>.of(newValues);
          _currentValues[series.id] = List<double>.of(newValues);
          _startOpacity[series.id] = 0.0;
          _currentOpacity[series.id] = 0.0;
          visibilityChanged = true;
        } else {
          // Bars grow in from the zero line.
          _startValues[series.id] = _zeroes();
          _currentValues[series.id] = _zeroes();
          _startOpacity[series.id] = 1.0;
          _currentOpacity[series.id] = 1.0;
        }
        _finalValues[series.id] = newValues;
        _finalOpacity[series.id] = 1.0;
        changed = true;
      } else {
        final List<double> startValues = _startValues[series.id]!;
        final List<double> currentValues = _currentValues[series.id]!;

        for (int i = 0; i < _valueCount; i++) {
          final double newValue = _valueAt(series, i);
          if (finalValues[i] == newValue) {
            continue;
          }

          startValues[i] = currentValues[i];
          finalValues[i] = newValue;
          changed = true;
        }

        // A series that was fading out fades back in when it becomes
        // visible again.
        if (_finalOpacity[series.id] != 1.0) {
          _startOpacity[series.id] = _currentOpacity[series.id]!;
          _finalOpacity[series.id] = 1.0;
          changed = true;
          visibilityChanged = true;
        }
      }
    }

    // Series no longer visible animate out: lines fade in place, bars
    // shrink to the zero line.
    for (final String id in _seriesById.keys) {
      if (_visibleIds.contains(id)) {
        continue;
      }

      if (_seriesById[id]!.type == YgChartSeriesType.line) {
        if (_finalOpacity[id] != 0.0) {
          _startOpacity[id] = _currentOpacity[id]!;
          _finalOpacity[id] = 0.0;
          changed = true;
          visibilityChanged = true;
        }
        continue;
      }

      final List<double> startValues = _startValues[id]!;
      final List<double> currentValues = _currentValues[id]!;
      final List<double> finalValues = _finalValues[id]!;

      for (int i = 0; i < _valueCount; i++) {
        if (finalValues[i] == 0.0) {
          continue;
        }

        startValues[i] = currentValues[i];
        finalValues[i] = 0.0;
        changed = true;
      }
    }

    final bool anyChange = _updateAxisTargets() || changed;
    if (anyChange) {
      _staged = visibilityChanged;
    }

    return anyChange;
  }

  /// Moves the current values, opacities and axis ranges towards their
  /// final state.
  ///
  /// [animationValue] is the linear progress of the running animation, where
  /// 0.0 is the state at the last [updateData] call and 1.0 the final state.
  /// Easing happens here, per channel: in a staged animation (see [_staged])
  /// fading finishes before the values and axis ranges start moving, so only
  /// one thing happens at a time.
  void applyAnimationValue(double animationValue) {
    final double t = math.min(1.0, math.max(0.0, animationValue));

    final double movementT;
    final double fadeOutT;
    final double fadeInT;
    if (_staged) {
      movementT = _easeOutCubic(_intervalT(t, _stagedMovementBegin, 1.0));
      fadeOutT = _easeOutCubic(_intervalT(t, 0.0, _fadeOutEnd));
      fadeInT = _easeOutCubic(_intervalT(t, _fadeInBegin, 1.0));
    } else {
      movementT = _easeInOutCubic(t);
      fadeOutT = movementT;
      fadeInT = movementT;
    }
    _movementProgress = movementT;

    _applyToAxis(_leftAxis, movementT);
    _applyToAxis(_rightAxis, movementT);

    for (final MapEntry<String, List<double>> entry in _currentValues.entries) {
      final List<double> startValues = _startValues[entry.key]!;
      final List<double> finalValues = _finalValues[entry.key]!;

      for (int i = 0; i < _valueCount; i++) {
        entry.value[i] = lerpDouble(startValues[i], finalValues[i], movementT)!;
      }

      final double startOpacity = _startOpacity[entry.key]!;
      final double finalOpacity = _finalOpacity[entry.key]!;
      final double opacityT = finalOpacity < startOpacity ? fadeOutT : fadeInT;
      _currentOpacity[entry.key] = lerpDouble(startOpacity, finalOpacity, opacityT)!;
    }

    _pruneRemovedSeries();
  }

  bool _updateAxisTargets() {
    final (double? leftMin, double? leftMax, bool leftHasBars) = _rawExtentOf(YgChartAxis.left);
    final (double? rightMin, double? rightMax, bool rightHasBars) = _rawExtentOf(YgChartAxis.right);

    // Axes with only line series and all values above zero zoom in on the
    // data instead of anchoring at zero, so small variations (e.g. room
    // temperatures) stay readable. Bars always grow from the zero line.
    final bool leftFloats = !leftHasBars && leftMin != null && leftMin > 0.0;
    final bool rightFloats = !rightHasBars && rightMin != null && rightMin > 0.0;

    // Zero-anchored extents of the axes that keep their zero line.
    final double leftRawMin = math.min(leftMin ?? 0.0, 0.0);
    final double leftRawMax = math.max(leftMax ?? 0.0, 0.0);
    final double rightRawMin = math.min(rightMin ?? 0.0, 0.0);
    final double rightRawMax = math.max(rightMax ?? 0.0, 0.0);

    final int intervals = _tickCount - 1;

    // The anchored axes share the amount of intervals below zero, so their
    // zero lines are drawn on the same height. Floating axes do not show a
    // zero line, so they are excluded.
    int negativeIntervals = math.max(
      leftFloats ? 0 : _negativeIntervalsFor(leftRawMin, leftRawMax, intervals),
      rightFloats ? 0 : _negativeIntervalsFor(rightRawMin, rightRawMax, intervals),
    );
    if ((!leftFloats && leftRawMax > 0.0) || (!rightFloats && rightRawMax > 0.0)) {
      // Keep room for positive values even when the other axis only has
      // negative ones.
      negativeIntervals = math.min(negativeIntervals, intervals - 1);
    }

    final bool leftChanged = leftFloats
        ? _retargetFloatingAxis(
            axis: _leftAxis,
            rawMin: leftMin,
            rawMax: leftMax!,
            intervals: intervals,
          )
        : _retargetAxis(
            axis: _leftAxis,
            rawMin: leftRawMin,
            rawMax: leftRawMax,
            negativeIntervals: negativeIntervals,
            intervals: intervals,
          );
    final bool rightChanged = rightFloats
        ? _retargetFloatingAxis(
            axis: _rightAxis,
            rawMin: rightMin,
            rawMax: rightMax!,
            intervals: intervals,
          )
        : _retargetAxis(
            axis: _rightAxis,
            rawMin: rightRawMin,
            rawMax: rightRawMax,
            negativeIntervals: negativeIntervals,
            intervals: intervals,
          );

    return leftChanged || rightChanged;
  }

  /// Lowest and highest value that will be shown on [axis], based on the
  /// final values of the visible series, and whether the axis has visible
  /// bar series.
  ///
  /// Series animating out are excluded, so the axis rescales to the
  /// remaining data right away. Bar series stack, so their positive and
  /// negative values are summed per index and zero is included in their
  /// extent. Returns null bounds when the axis has no visible series.
  (double?, double?, bool) _rawExtentOf(YgChartAxis axis) {
    double? rawMin;
    double? rawMax;
    bool hasBars = false;
    final List<double> positiveSums = List<double>.filled(_valueCount, 0.0);
    final List<double> negativeSums = List<double>.filled(_valueCount, 0.0);

    for (final YgChartSeries series in _seriesById.values) {
      if (series.axis != axis || !_visibleIds.contains(series.id)) {
        continue;
      }

      final List<double> finalValues = _finalValues[series.id]!;
      for (int i = 0; i < _valueCount; i++) {
        final double value = finalValues[i];

        if (series.type == YgChartSeriesType.bar) {
          hasBars = true;
          if (value >= 0.0) {
            positiveSums[i] += value;
          } else {
            negativeSums[i] += value;
          }
        } else {
          rawMin = math.min(rawMin ?? value, value);
          rawMax = math.max(rawMax ?? value, value);
        }
      }
    }

    if (hasBars) {
      for (int i = 0; i < _valueCount; i++) {
        rawMax = math.max(rawMax ?? positiveSums[i], positiveSums[i]);
        rawMin = math.min(rawMin ?? negativeSums[i], negativeSums[i]);
      }
    }

    return (rawMin, rawMax, hasBars);
  }

  int _negativeIntervalsFor(double rawMin, double rawMax, int intervals) {
    if (rawMin >= 0.0) {
      return 0;
    }
    if (rawMax <= 0.0) {
      return intervals;
    }

    final double negativeFraction = -rawMin / (rawMax - rawMin);
    final int negativeIntervals = (negativeFraction * intervals).ceil();

    return math.min(intervals, math.max(1, negativeIntervals));
  }

  bool _retargetAxis({
    required _YgChartAxisState axis,
    required double rawMin,
    required double rawMax,
    required int negativeIntervals,
    required int intervals,
  }) {
    final int positiveIntervals = intervals - negativeIntervals;

    double requiredStep = 0.0;
    if (rawMax > 0.0 && positiveIntervals > 0) {
      requiredStep = math.max(requiredStep, rawMax / positiveIntervals);
    }
    if (rawMin < 0.0 && negativeIntervals > 0) {
      requiredStep = math.max(requiredStep, -rawMin / negativeIntervals);
    }

    final double step = requiredStep > 0.0 ? _niceStepFor(requiredStep) : 1.0;

    return _applyAxisTarget(
      axis: axis,
      finalMin: -negativeIntervals * step,
      finalMax: positiveIntervals * step,
      precision: _precisionFor(step),
    );
  }

  /// Retargets [axis] to a range zoomed in on the data instead of starting
  /// at the zero line.
  ///
  /// Used for axes with only line series above zero, where anchoring at
  /// zero would flatten small variations into a nearly straight line.
  bool _retargetFloatingAxis({
    required _YgChartAxisState axis,
    required double rawMin,
    required double rawMax,
    required int intervals,
  }) {
    double paddedMin = rawMin;
    double paddedMax = rawMax;
    if (paddedMax - paddedMin <= 0.0) {
      // A completely flat line still gets a range, so it renders in the
      // middle of the plot instead of on its edge.
      final double padding = math.max(paddedMax.abs() * 0.05, 1.0);
      paddedMin -= padding;
      paddedMax += padding;
    }

    double step = _niceStepFor((paddedMax - paddedMin) / intervals);
    double finalMin = (paddedMin / step).floorToDouble() * step;
    while (finalMin + intervals * step < paddedMax) {
      // Flooring the min pushed the top of the range below the data, grow
      // to the next nice step and try again.
      step = _niceStepFor(step * 1.5);
      finalMin = (paddedMin / step).floorToDouble() * step;
    }

    if (finalMin < 0.0) {
      // Only reachable through the flat line padding; the data itself is
      // above zero, so showing a negative range would be misleading.
      finalMin = 0.0;
    }

    return _applyAxisTarget(
      axis: axis,
      finalMin: finalMin,
      finalMax: finalMin + intervals * step,
      precision: _precisionFor(step),
    );
  }

  bool _applyAxisTarget({
    required _YgChartAxisState axis,
    required double finalMin,
    required double finalMax,
    required int precision,
  }) {
    if (axis.finalMin == finalMin && axis.finalMax == finalMax && axis.precision == precision) {
      return false;
    }

    axis.labelStartMin = axis.finalMin;
    axis.labelStartMax = axis.finalMax;
    axis.labelStartPrecision = axis.precision;
    axis.startMin = axis.currentMin;
    axis.startMax = axis.currentMax;
    axis.finalMin = finalMin;
    axis.finalMax = finalMax;
    axis.precision = precision;

    return true;
  }

  /// Rounds [roughStep] up to a 1 / 2 / 2.5 / 5 multiple of a power of ten,
  /// so the axis labels end up as round numbers.
  double _niceStepFor(double roughStep) {
    final double magnitude = math.pow(10.0, (math.log(roughStep) / math.ln10).floorToDouble()).toDouble();
    final double normalized = roughStep / magnitude;

    final double niceNormalized;
    if (normalized <= 1.0) {
      niceNormalized = 1.0;
    } else if (normalized <= 2.0) {
      niceNormalized = 2.0;
    } else if (normalized <= 2.5) {
      niceNormalized = 2.5;
    } else if (normalized <= 5.0) {
      niceNormalized = 5.0;
    } else {
      niceNormalized = 10.0;
    }

    return niceNormalized * magnitude;
  }

  /// Smallest amount of decimals that renders multiples of [step] exactly.
  int _precisionFor(double step) {
    double scaled = step;
    for (int precision = 0; precision < _maxPrecision; precision++) {
      if ((scaled - scaled.roundToDouble()).abs() < 0.000001) {
        return precision;
      }
      scaled *= 10.0;
    }

    return _maxPrecision;
  }

  void _applyToAxis(_YgChartAxisState axis, double t) {
    axis.currentMin = lerpDouble(axis.startMin, axis.finalMin, t)!;
    axis.currentMax = lerpDouble(axis.startMax, axis.finalMax, t)!;
  }

  /// Progress within the (begin, end) sub-interval of the animation.
  double _intervalT(double t, double begin, double end) {
    if (t <= begin) {
      return 0.0;
    }
    if (t >= end) {
      return 1.0;
    }

    return (t - begin) / (end - begin);
  }

  double _easeInOutCubic(double t) {
    return t < 0.5 ? 4.0 * t * t * t : 1.0 - math.pow(-2.0 * t + 2.0, 3.0) / 2.0;
  }

  double _easeOutCubic(double t) {
    return 1.0 - math.pow(1.0 - t, 3.0).toDouble();
  }

  void _pruneRemovedSeries() {
    final List<String> idsToRemove = <String>[];

    for (final String id in _seriesById.keys) {
      if (_visibleIds.contains(id)) {
        continue;
      }

      // A faded out line is done animating out.
      if (_currentOpacity[id] == 0.0 && _finalOpacity[id] == 0.0) {
        idsToRemove.add(id);
        continue;
      }

      final List<double> currentValues = _currentValues[id]!;
      final List<double> finalValues = _finalValues[id]!;
      bool allZero = true;
      for (int i = 0; i < _valueCount; i++) {
        if (currentValues[i] != 0.0 || finalValues[i] != 0.0) {
          allZero = false;
          break;
        }
      }

      if (allZero) {
        idsToRemove.add(id);
      }
    }

    for (final String id in idsToRemove) {
      _seriesById.remove(id);
      _startValues.remove(id);
      _currentValues.remove(id);
      _finalValues.remove(id);
      _startOpacity.remove(id);
      _currentOpacity.remove(id);
      _finalOpacity.remove(id);
    }
  }

  _YgChartAxisState _axisStateOf(YgChartAxis axis) {
    return switch (axis) {
      YgChartAxis.left => _leftAxis,
      YgChartAxis.right => _rightAxis,
    };
  }

  double _valueAt(YgChartSeries series, int index) {
    if (index < 0 || index >= series.values.length) {
      return 0.0;
    }

    return series.values[index];
  }

  List<double> _zeroes() {
    return List<double>.filled(_valueCount, 0.0);
  }
}

/// Animated range of a single vertical axis.
class _YgChartAxisState {
  _YgChartAxisState();

  double startMin = 0.0;
  double currentMin = 0.0;
  double finalMin = 0.0;

  double startMax = 1.0;
  double currentMax = 1.0;
  double finalMax = 1.0;

  int precision = 0;

  /// The final range and precision of the previous animation target.
  ///
  /// Unlike [startMin] and [startMax], which are set to the mid-animation
  /// current range when retargeting, these always hold the last fully
  /// targeted range, so the axis labels cross-fade between round values.
  double labelStartMin = 0.0;
  double labelStartMax = 1.0;
  int labelStartPrecision = 0;
}
