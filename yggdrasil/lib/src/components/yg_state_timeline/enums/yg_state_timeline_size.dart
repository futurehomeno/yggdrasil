/// Predefined sizes for the bar of a [YgStateTimeline].
///
/// The timeline always fills the available width, the size only determines
/// the height of the bar (excluding the axis labels and the legend), like
/// [YgChartSize] does for the chart canvas.
enum YgStateTimelineSize {
  small(20.0),
  medium(32.0)
  ;

  const YgStateTimelineSize(this.barHeight);

  /// Height of the timeline bar.
  final double barHeight;
}
