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

  /// Rendered as a stepped line with the area down to the zero line filled
  /// translucently, resembling bars, for example power drawn over a day.
  ///
  /// Each value holds over the full width of its slot. Like bars the series
  /// keeps its axis anchored at the zero line and animates in and out by
  /// growing from and shrinking to it, but it does not stack.
  steppedArea
  ;

  /// Whether series of this type appear and disappear by fading in place
  /// instead of growing from and shrinking to the zero line.
  bool get fadesInPlace => this == line || this == band;

  /// Whether series of this type keep their axis anchored at the zero line
  /// instead of letting it zoom in on the data.
  bool get anchorsAtZero => this == bar || this == steppedArea;
}
