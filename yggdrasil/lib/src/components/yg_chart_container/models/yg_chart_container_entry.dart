import 'package:yggdrasil/src/components/yg_chart/_yg_chart.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/_yg_state_timeline.dart';

/// Builds the text shown after the subtitle of a [YgChartContainerTimeline]
/// while the container is scrubbed.
///
/// Called with the long pressed moment on the shared time span of the
/// [YgChartContainer]. Return for example a formatted consumption
/// ("12 kWh") resolved from data the container does not know about, or
/// null to show no value for the moment.
typedef YgChartContainerValueBuilder = String? Function(double position);

/// Builds the text shown after the subtitle of a [YgChartContainerChart]
/// while the container is scrubbed.
///
/// Called with the index of the column the scrub indicator snapped to.
typedef YgChartContainerColumnValueBuilder = String? Function(int index);

/// One chart shown in a [YgChartContainer], with a subtitle above it.
sealed class YgChartContainerEntry {
  const YgChartContainerEntry({
    required this.subtitle,
    this.showLegend = true,
  });

  /// Short title shown above the chart, for example "Thermostat mode".
  ///
  /// While the container is scrubbed the value at the pressed moment is
  /// appended, for example "Thermostat mode: Heat".
  final String subtitle;

  /// Whether the legend naming the series is shown below the chart.
  final bool showLegend;
}

/// A [YgStateTimeline] entry of a [YgChartContainer].
class YgChartContainerTimeline extends YgChartContainerEntry {
  const YgChartContainerTimeline({
    required super.subtitle,
    required this.series,
    this.size = YgStateTimelineSize.small,
    super.showLegend,
    this.valueBuilder,
  });

  /// The states shown on the timeline, see [YgStateTimeline.series].
  final List<YgStateTimelineSeries> series;

  /// Size of the timeline bar, see [YgStateTimelineSize].
  final YgStateTimelineSize size;

  /// Overrides the text appended to [subtitle] while scrubbing.
  ///
  /// When null the label of the state active at the pressed moment is
  /// shown, or nothing when no state is active there.
  final YgChartContainerValueBuilder? valueBuilder;
}

/// A [YgChart] entry of a [YgChartContainer], for example a line chart of
/// the power drawn over the shared time span.
class YgChartContainerChart extends YgChartContainerEntry {
  const YgChartContainerChart({
    required super.subtitle,
    required this.series,
    required this.xLabels,
    this.size = YgChartSize.small,
    super.showLegend,
    this.leftAxisSnap,
    this.rightAxisSnap,
    this.valueBuilder,
  });

  /// The data series shown on the chart, see [YgChart.series].
  final List<YgChartSeries> series;

  /// Labels of the chart columns, one per value index, see
  /// [YgChart.xLabels].
  ///
  /// The columns are expected to divide the shared time span of the
  /// container evenly: with a span of one day, 24 values mean one column
  /// per hour.
  final List<String> xLabels;

  /// Size of the chart canvas, see [YgChartSize].
  final YgChartSize size;

  /// Snaps the axis bounds, see [YgChart.leftAxisSnap].
  final double? leftAxisSnap;
  final double? rightAxisSnap;

  /// Overrides the text appended to [subtitle] while scrubbing.
  ///
  /// When null the value of the first series at the scrubbed column is
  /// shown with its unit, for example "2.5 kW".
  final YgChartContainerColumnValueBuilder? valueBuilder;
}
