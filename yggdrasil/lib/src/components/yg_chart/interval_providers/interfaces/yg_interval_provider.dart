import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

abstract class YgIntervalProvider {
  const YgIntervalProvider();

  IntervalData getIntervalData({
    required DoubleRange dataRange,
    required double space,
    int? intervals,
  });
}

class YgNoIntervalProvider extends YgIntervalProvider {
  const YgNoIntervalProvider();

  @override
  IntervalData getIntervalData({
    required DoubleRange dataRange,
    required double space,
    int? intervals,
  }) {
    return IntervalData(
      intervals: <YgInterval>[],
      range: dataRange,
      precision: 0,
    );
  }
}

class AxisDataTween extends Tween<AxisData> {
  factory AxisDataTween({
    required AxisData begin,
    required AxisData end,
  }) {
    final Map<int, IntervalData> dataMap = <int, IntervalData>{};

    DoubleRange beginRange = begin.range;
    DoubleRange endRange = begin.range;

    // If we try to interpolate from a data that has a empty range, we will
    // create a new start range which starts in the middle of the end range to
    // make fading in data on graphs where the start range is not 0 a more
    // pleasing effect.
    if (beginRange.isEmpty && endRange.isNotEmpty) {
      beginRange = DoubleRange(
        start: endRange.start,
        end: endRange.start,
      );
    }
    if (endRange.isEmpty && beginRange.isNotEmpty) {
      endRange = DoubleRange(
        start: beginRange.start,
        end: beginRange.start,
      );
    }

    for (final YgInterval interval in begin.intervals) {
      final int id = (interval.position * tolerance).toInt();

      final IntervalData data = dataMap[id] ??= IntervalData();

      data.startFade = interval.fade;
      data.startPosition = interval.position;
      data.startPrecision = interval.precision;
    }

    for (final YgInterval interval in end.intervals) {
      final int id = (interval.position * tolerance).toInt();

      final IntervalData data = dataMap[id] ??= IntervalData();

      data.endFade = interval.fade;
      data.endPosition = interval.position;
      data.endPrecision = interval.precision;
    }

    for (final IntervalData data in dataMap.values) {
      // If the end range does not contain a point, we do not need to fade out
      // in the same way, if the start range does not contain a point, we do not
      // need to fade in.
      if (data.endFade == null) {
        if (endRange.isEmpty || endRange.containsPoint(data.startPosition!)) {
          data.endFade = 0;
        } else {
          data.endFade = 1;
        }
      } else if (data.startFade == null) {
        if (beginRange.isEmpty || beginRange.containsPoint(data.endPosition!)) {
          data.startFade = 0;
        } else {
          data.startFade = 1;
        }
      }
    }

    return AxisDataTween._(
      intervalData: dataMap.values.toList(),
      beginRange: beginRange,
      endRange: endRange,
      begin: begin,
      end: end,
    );
  }

  AxisDataTween._({
    required super.begin,
    required super.end,
    required this.intervalData,
    required this.endRange,
    required this.beginRange,
  });

  static const int tolerance = 10000000000;

  final List<IntervalData> intervalData;
  final DoubleRange beginRange;
  final DoubleRange endRange;

  @override
  AxisData lerp(double t) {
    final List<YgInterval> intervals = <YgInterval>[];

    for (final IntervalData data in intervalData) {
      intervals.add(YgInterval(
        position: lerpDouble(data.startPosition, data.endPosition, t)!,
        precision: lerpDouble(data.startPrecision, data.endPrecision, t)!.round(),
        fade: lerpDouble(data.startFade, data.endFade, t)!,
      ));
    }

    return AxisData(
      intervals: intervals,
      range: beginRange.lerpTo(
        endRange,
        t,
      ),
    );
  }
}

class IntervalData {
  double? startPosition;
  double? endPosition;
  double? startFade;
  double? endFade;
  int? startPrecision;
  int? endPrecision;
}
