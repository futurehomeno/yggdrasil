/// Determines how a [YgChartSeries] is rendered on the chart canvas.
enum YgChartSeriesType {
  /// Rendered as vertical bars.
  ///
  /// Bar series assigned to the same axis are stacked on top of each other.
  bar,

  /// Rendered as a continuous line drawn on top of the bars.
  line,
}
