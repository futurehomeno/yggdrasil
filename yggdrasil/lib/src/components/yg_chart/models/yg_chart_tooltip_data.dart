import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/yg_chart_series.dart';

/// Builds the tooltip content of a [YgChart].
///
/// The returned widget is shown above the plot while the user long presses
/// the chart, horizontally following the pressed column.
typedef YgChartTooltipBuilder = Widget Function(BuildContext context, YgChartTooltipData data);

/// The values a [YgChart] tooltip is built with.
class YgChartTooltipData {
  const YgChartTooltipData({
    required this.index,
    required this.xLabel,
    required this.entries,
  });

  /// Index of the long pressed value column.
  final int index;

  /// The x-axis label of the pressed column.
  final String xLabel;

  /// One entry per visible series, in the order of [YgChart.series].
  ///
  /// Series hidden through the legend are not included.
  final List<YgChartTooltipEntry> entries;
}

/// The value of one series at the pressed index of a [YgChart] tooltip.
class YgChartTooltipEntry {
  const YgChartTooltipEntry({
    required this.series,
    required this.value,
    this.lowerValue,
    this.upperValue,
  });

  /// The series the value belongs to, with its resolved color.
  final YgChartSeries series;

  /// The exact value of the series at the pressed index.
  ///
  /// This is the value passed to [YgChartSeries.values], not the animated
  /// value currently shown on the chart. For band series this is the center
  /// line value.
  final double value;

  /// The exact band bounds of the series at the pressed index.
  ///
  /// Only set for [YgChartSeriesType.band] series, see
  /// [YgChartSeries.lowerValues] and [YgChartSeries.upperValues].
  final double? lowerValue;
  final double? upperValue;
}
