import 'dart:collection';

import 'package:flutter/animation.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/segmented_bar.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/segmented_bar_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/tweens/segmented_bar_tween.dart';

class SegmentedBarChartDataTween extends Tween<SegmentedBarChartData> {
  SegmentedBarChartDataTween({
    required super.begin,
    required super.end,
  }) {
    totalRange = begin!.indexRange.encapsulate(end!.indexRange).toIntRange();

    for (int i = totalRange.start.toInt(); i < totalRange.end; i++) {
      segmentedBarTweens.add(SegmentedBarTween(
        begin: begin!.points.elementAtOrNull(i),
        end: end!.points.elementAtOrNull(i),
      ));
    }
  }

  final List<SegmentedBarTween> segmentedBarTweens = <SegmentedBarTween>[];
  late final IntRange totalRange;

  @override
  SegmentedBarChartData lerp(double t) {
    return SegmentedBarChartData(
      indexRange: totalRange,
      points: <SegmentedBar>[
        for (final SegmentedBarTween tween in segmentedBarTweens) tween.lerp(t),
      ],
      valueRange: begin!.valueRange.lerp(end!.valueRange, t),
    );
  }
}
