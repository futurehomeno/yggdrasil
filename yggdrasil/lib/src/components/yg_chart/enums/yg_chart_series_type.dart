/// Determines how a [YgChartSeries] is rendered on the chart canvas.
enum YgChartSeriesType {
  /// Rendered as vertical bars.
  ///
  /// Bar series assigned to the same axis are stacked on top of each other.
  bar,

  /// Rendered as a continuous line drawn on top of the bars.
  line,

  /// Rendered as a line with a translucent area between a lower and upper
  /// bound, for example the average of multiple sensors with their min-max
  /// envelope.
  ///
  /// Band series must provide [YgChartSeries.lowerValues] and
  /// [YgChartSeries.upperValues] in addition to [YgChartSeries.values],
  /// which holds the center line.
  band,
}
