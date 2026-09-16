/// Predefined sizes for the chart canvas.
///
/// The chart always fills the available width, the size only determines the
/// height of the canvas and how many value steps are shown on the axes.
enum YgChartSize {
  /// Meant for the axis-less [YgChartSimple]; a full [YgChart] gets very
  /// cramped at this height once the axis rows are subtracted.
  xxxsmall(60.0),
  xxsmall(80.0),
  xsmall(120.0),
  small(160.0),
  medium(240.0),
  large(320.0)
  ;

  const YgChartSize(this.height);

  /// Height of the chart canvas, excluding the legend.
  final double height;
}
