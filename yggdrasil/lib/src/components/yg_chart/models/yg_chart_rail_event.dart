import 'package:flutter/material.dart';

/// One event shown as a tick on the event density rail of a [YgChart].
///
/// The rail is meant for events too numerous to mark with individual badges
/// (see [YgChartEventMarker]): every event renders as a thin vertical tick
/// at its exact position, and dragging along the rail selects one column
/// wide band, reported through [YgChart.onRailBandSelected].
class YgChartRailEvent {
  const YgChartRailEvent({
    required this.position,
    this.color,
  });

  /// Position of the event along the x-axis, in column units.
  ///
  /// A value of `2.5` places the tick in the middle of the third column.
  /// Must be between 0 and the amount of [YgChart.xLabels].
  final double position;

  /// Color of the tick.
  ///
  /// When null the default rail event color of the chart is used.
  final Color? color;
}
