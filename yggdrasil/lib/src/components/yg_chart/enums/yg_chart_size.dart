/// Predefined sizes for the chart canvas.
///
/// The chart always fills the available width, the size only determines the
/// height of the canvas and how many value steps are shown on the axes.
enum YgChartSize {
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
