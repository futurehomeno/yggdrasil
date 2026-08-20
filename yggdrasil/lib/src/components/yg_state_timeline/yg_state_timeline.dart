import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_colors.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/models/_models.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/widgets/yg_state_timeline_legend.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/yg_state_timeline_painter.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// A horizontal bar showing which state was active from when to when, for
/// example the heating / cooling / idle states of a thermostat over a day.
///
/// - Shaped like a progress bar: a rounded track filled with one colored
///   segment per state range, proportional to its duration. Where no state
///   was active the track shows through.
/// - The timeline spans [start] to [end] in a unit chosen by the caller
///   (hours, minutes, timestamps); the ranges of the series use the same
///   unit. Ranges outside of the span are clipped.
/// - Series without an explicit color get one assigned from [YgChartColors],
///   like on a [YgChart].
/// - [axisLabels] are distributed evenly below the bar; a legend below names
///   the states.
class YgStateTimeline extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgStateTimeline({
    super.key,
    required this.series,
    required this.start,
    required this.end,
    this.axisLabels = const <String>[],
    this.size = YgStateTimelineSize.small,
    this.showLegend = true,
  });

  /// The states shown on the timeline.
  ///
  /// Ranges of different series are expected not to overlap; when they do,
  /// the series later in this list is drawn on top. The order also
  /// determines the legend order and the automatic color assignment.
  final List<YgStateTimelineSeries> series;

  /// Value at the left edge of the bar.
  final double start;

  /// Value at the right edge of the bar.
  ///
  /// Must be greater than [start].
  final double end;

  /// Labels distributed evenly below the bar.
  ///
  /// The first label is aligned with the left edge of the bar and the last
  /// with the right edge. When empty no label row is shown.
  final List<String> axisLabels;

  /// Size of the timeline bar, see [YgStateTimelineSize].
  final YgStateTimelineSize size;

  /// Whether the legend naming the states is shown below the bar.
  final bool showLegend;

  @override
  Widget build(BuildContext context) {
    assert(_debugValidateSeries());

    final YgColor colors = context.tokens.colors;
    final List<YgStateTimelineSeries> resolvedSeries = _resolveSeriesColors(context);

    final double canvasHeight =
        size.barHeight + (axisLabels.isNotEmpty ? YgStateTimelinePainter.axisLabelRowHeight : 0.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: canvasHeight,
          child: RepaintBoundary(
            child: CustomPaint(
              painter: YgStateTimelinePainter(
                series: resolvedSeries,
                start: start,
                end: end,
                axisLabels: axisLabels,
                barHeight: size.barHeight,
                borderRadius: context.tokens.radii.xxl,
                trackColor: colors.backgroundWeak,
                fallbackSegmentColor: colors.iconDefault,
                axisTextStyle: context.tokens.textStyles.caption1Regular.copyWith(
                  color: colors.textWeak,
                ),
              ),
            ),
          ),
        ),
        if (showLegend && resolvedSeries.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: context.tokens.dimensions.xxs),
            child: YgStateTimelineLegend(series: resolvedSeries),
          ),
      ],
    );
  }

  /// The series with their color filled in, assigned by position like on a
  /// [YgChart].
  List<YgStateTimelineSeries> _resolveSeriesColors(BuildContext context) {
    final List<Color> colors = YgChartColors.resolveAutoColors(
      context,
      <Color?>[for (final YgStateTimelineSeries currentSeries in series) currentSeries.color],
    );

    return <YgStateTimelineSeries>[
      for (final (int index, YgStateTimelineSeries currentSeries) in series.indexed)
        currentSeries.color != null ? currentSeries : currentSeries.copyWith(color: colors[index]),
    ];
  }

  bool _debugValidateSeries() {
    assert(
      end > start,
      'YgStateTimeline end ($end) must be greater than start ($start).',
    );

    final Set<String> seriesIds = <String>{};
    for (final YgStateTimelineSeries currentSeries in series) {
      assert(
        seriesIds.add(currentSeries.id),
        'YgStateTimeline series ids must be unique, found duplicate '
        '"${currentSeries.id}".',
      );

      for (final YgStateTimelineRange range in currentSeries.ranges) {
        assert(
          range.end >= range.start,
          'YgStateTimeline series "${currentSeries.id}" has a range ending '
          '(${range.end}) before it starts (${range.start}).',
        );
      }
    }

    return true;
  }
}
