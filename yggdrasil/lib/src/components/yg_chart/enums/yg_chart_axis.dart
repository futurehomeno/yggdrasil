/// The vertical axis a [YgChartSeries] is scaled against.
///
/// Using both axes on one chart allows showing two different measures,
/// for example energy consumption (left) and energy price (right).
enum YgChartAxis {
  /// The primary axis, drawn on the left side of the chart.
  left,

  /// The secondary axis, drawn on the right side of the chart.
  right,
}
