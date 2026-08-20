import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_icon_data/_yg_icon_data.dart';

/// A badge marking events (for example device errors) in one column of a
/// [YgChart].
///
/// Rendered as a colored circle in the upper part of the plot, centered on
/// the column of [index]. Shows [icon] when given, otherwise the number of
/// events ([count]). At most one marker can be placed per column; tapping it
/// reports the marker through [YgChart.onEventMarkerTap].
class YgChartEventMarker {
  const YgChartEventMarker({
    required this.index,
    required this.color,
    this.icon,
    this.count = 1,
    this.label,
    this.foregroundColor = Colors.white,
  });

  /// Index of the column the marker is placed on.
  ///
  /// Must be within the range of [YgChart.xLabels].
  final int index;

  /// Color of the badge circle.
  final Color color;

  /// Icon shown inside the badge.
  ///
  /// When null the badge shows [count] instead.
  final YgColorableIconData? icon;

  /// Number of events the marker stands for, shown inside the badge when
  /// [icon] is null.
  final int count;

  /// Semantic label of the badge, read by screen readers.
  final String? label;

  /// Color of the icon or count inside the badge.
  ///
  /// Defaults to white, which keeps contrast on the saturated badge colors
  /// this marker is meant to carry; pass a dark color together with a light
  /// [color].
  final Color foregroundColor;
}
