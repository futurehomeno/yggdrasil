import 'package:flutter/material.dart';

/// A time range in which the state of a [YgStateTimelineSeries] was active.
///
/// [start] and [end] are in the same unit as [YgStateTimeline.start] and
/// [YgStateTimeline.end], for example hours of the day or timestamps. Parts
/// of the range outside of the timeline span are not drawn.
class YgStateTimelineRange {
  const YgStateTimelineRange({
    required this.start,
    required this.end,
  });

  /// When the state became active.
  final double start;

  /// When the state stopped being active.
  ///
  /// Must not be smaller than [start].
  final double end;
}

/// One state shown on a [YgStateTimeline], with the ranges it was active in.
class YgStateTimelineSeries {
  const YgStateTimelineSeries({
    required this.id,
    required this.label,
    required this.ranges,
    this.color,
  });

  /// Unique identifier of the series.
  final String id;

  /// Human readable name of the state, shown in the legend.
  final String label;

  /// The ranges in which the state was active.
  ///
  /// Ranges of different series are expected not to overlap; when they do,
  /// the series later in [YgStateTimeline.series] is drawn on top.
  final List<YgStateTimelineRange> ranges;

  /// Color of the state on the bar and in the legend.
  ///
  /// When null a color is automatically assigned from [YgChartColors] based
  /// on the position of the series in [YgStateTimeline.series].
  final Color? color;

  /// Copy of this series with the given fields replaced.
  YgStateTimelineSeries copyWith({
    Color? color,
  }) {
    return YgStateTimelineSeries(
      id: id,
      label: label,
      ranges: ranges,
      color: color ?? this.color,
    );
  }
}
