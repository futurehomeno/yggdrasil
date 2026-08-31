import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/_yg_chart.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_painter.dart';
import 'package:yggdrasil/src/components/yg_chart_container/models/_models.dart';
import 'package:yggdrasil/src/components/yg_chart_container/yg_chart_container_indicator_painter.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/_yg_state_timeline.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Stacks up to [maxEntries] charts over the same time span, with a small
/// subtitle per chart and a shared scrub interaction.
///
/// - An entry is either a [YgStateTimeline] or a [YgChart] (for example a
///   line chart of the power drawn), see [YgChartContainerTimeline] and
///   [YgChartContainerChart]. All entries span [start] to [end] in a unit
///   chosen by the caller (hours, minutes, timestamps); timelines share
///   the [axisLabels] shown below them, charts bring their own column
///   labels.
/// - The plots of all entries are horizontally aligned: timelines are
///   inset to match the widest axis gutters of the charts.
/// - Long pressing any entry draws an orange indicator at the pressed
///   moment on every entry: a capsule handle on timeline bars and a full
///   height line with a dot per line series on chart plots. With chart
///   entries the pressed moment snaps to the column grid of the chart
///   with the most columns, so the indicator sits at the same x on every
///   entry; timeline-only containers scrub continuously.
/// - While scrubbing every subtitle shows the value at the pressed moment,
///   for example "Mode: Heat" or "Power: 2.5 kW". Defaults are the label
///   of the active state (timelines) and the first series value with its
///   unit (charts, skipping series hidden through the legend); the
///   valueBuilder of an entry overrides the text.
class YgChartContainer extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgChartContainer({
    super.key,
    required this.entries,
    required this.start,
    required this.end,
    this.axisLabels = const <String>[],
  });

  /// Maximum amount of charts shown in one container.
  static const int maxEntries = 3;

  /// The charts shown in the container, from top to bottom.
  ///
  /// Must hold 1 to [maxEntries] entries.
  final List<YgChartContainerEntry> entries;

  /// Value at the left edge of every plot.
  final double start;

  /// Value at the right edge of every plot.
  ///
  /// Must be greater than [start].
  final double end;

  /// Labels distributed evenly below every timeline entry, see
  /// [YgStateTimeline.axisLabels].
  ///
  /// Chart entries label their columns through
  /// [YgChartContainerChart.xLabels] instead.
  final List<String> axisLabels;

  @override
  State<YgChartContainer> createState() => _YgChartContainerState();
}

class _YgChartContainerState extends State<YgChartContainer> {
  /// The long pressed moment as a fraction (0..1) of the shared plot
  /// width, null while idle.
  ///
  /// Already snapped to the chart column grid, see [_snapFraction].
  double? _scrubFraction;

  /// One layout per chart entry, keyed by entry index, to read the natural
  /// axis gutter widths from.
  final Map<int, YgChartLayout> _chartLayouts = <int, YgChartLayout>{};

  /// The plot insets applied by the last build.
  ///
  /// Compared against the freshly computed insets on layout notifications,
  /// so only an actual gutter change rebuilds the container.
  (double, double) _appliedPlotInsets = (0.0, 0.0);

  /// Series hidden through the legend of a chart entry, keyed by entry
  /// index, so the default subtitle value skips them like the chart does.
  final Map<int, Set<String>> _hiddenSeriesByEntry = <int, Set<String>>{};

  @override
  void initState() {
    super.initState();
    _syncChartLayouts();
  }

  @override
  void didUpdateWidget(YgChartContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncChartLayouts();
  }

  @override
  void dispose() {
    for (final YgChartLayout layout in _chartLayouts.values) {
      layout.removeListener(_onChartLayoutChanged);
      layout.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(_debugValidateEntries());
    _appliedPlotInsets = _plotInsets;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPressStart: (LongPressStartDetails details) => _updateScrubFraction(details.localPosition),
      onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) => _updateScrubFraction(details.localPosition),
      onLongPressEnd: (LongPressEndDetails details) => _clearScrubFraction(),
      onLongPressCancel: _clearScrubFraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (final (int index, YgChartContainerEntry entry) in widget.entries.indexed)
            Padding(
              padding: EdgeInsets.only(top: index == 0 ? 0.0 : context.tokens.dimensions.md),
              child: _buildEntry(context, index, entry),
            ),
        ],
      ),
    );
  }

  Widget _buildEntry(BuildContext context, int index, YgChartContainerEntry entry) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildSubtitle(context, index, entry),
        Padding(
          padding: EdgeInsets.only(top: context.tokens.dimensions.xxs),
          child: switch (entry) {
            YgChartContainerTimeline() => _buildTimeline(context, entry),
            YgChartContainerChart() => _buildChart(context, index, entry),
          },
        ),
      ],
    );
  }

  Widget _buildTimeline(BuildContext context, YgChartContainerTimeline entry) {
    final double? scrubFraction = _scrubFraction;
    final (double leftInset, double rightInset) = _appliedPlotInsets;

    return Padding(
      // Aligns the timeline bar with the chart plots, see _plotInsets.
      padding: EdgeInsets.only(left: leftInset, right: rightInset),
      child: CustomPaint(
        foregroundPainter: scrubFraction == null
            ? null
            : YgChartContainerIndicatorPainter(
                fraction: scrubFraction,
                barHeight: entry.size.barHeight,
                color: YgChartScrubHandle.colorOf(context),
                ringColor: YgChartScrubHandle.ringColorOf(context),
              ),
        child: YgStateTimeline(
          series: entry.series,
          start: widget.start,
          end: widget.end,
          axisLabels: widget.axisLabels,
          size: entry.size,
          showLegend: entry.showLegend,
        ),
      ),
    );
  }

  Widget _buildChart(BuildContext context, int index, YgChartContainerChart entry) {
    final (double leftInset, double rightInset) = _appliedPlotInsets;

    return YgChart(
      series: entry.series,
      xLabels: entry.xLabels,
      size: entry.size,
      showLegend: entry.showLegend,
      leftAxisSnap: entry.leftAxisSnap,
      rightAxisSnap: entry.rightAxisSnap,
      onSeriesToggled: (YgChartSeries series, bool visible) => _onSeriesToggled(index, series, visible),
      scrubFraction: _scrubFraction,
      minLeftPlotInset: leftInset,
      minRightPlotInset: rightInset,
      layout: _chartLayouts[index],
    );
  }

  /// The subtitle above the chart, with the value at the scrubbed moment
  /// appended while scrubbing.
  Widget _buildSubtitle(BuildContext context, int index, YgChartContainerEntry entry) {
    final YgColor colors = context.tokens.colors;
    final double? scrubFraction = _scrubFraction;
    final String? valueText = scrubFraction == null ? null : _valueTextAt(index, entry, scrubFraction);

    return Text.rich(
      TextSpan(
        text: entry.subtitle,
        style: context.tokens.textStyles.paragraph3Bold.copyWith(
          color: colors.textDefault,
        ),
        children: <InlineSpan>[
          if (valueText != null)
            TextSpan(
              text: ': $valueText',
              style: context.tokens.textStyles.paragraph3Regular.copyWith(
                color: colors.textDefault,
              ),
            ),
        ],
      ),
    );
  }

  /// The text shown after the subtitle of the entry at [index] for the
  /// scrubbed [fraction].
  String? _valueTextAt(int index, YgChartContainerEntry entry, double fraction) {
    switch (entry) {
      case YgChartContainerTimeline():
        final double position = _positionOf(fraction);
        final YgChartContainerValueBuilder? valueBuilder = entry.valueBuilder;
        if (valueBuilder != null) {
          return valueBuilder(position);
        }

        // Later series are drawn on top on the timeline, so on overlap
        // their label wins here as well.
        for (final YgStateTimelineSeries series in entry.series.reversed) {
          for (final YgStateTimelineRange range in series.ranges) {
            if (position >= range.start && position <= range.end) {
              return series.label;
            }
          }
        }

        return null;

      case YgChartContainerChart():
        if (entry.xLabels.isEmpty) {
          return null;
        }

        final int column = YgChartPainter.columnAt(fraction, entry.xLabels.length);
        final YgChartContainerColumnValueBuilder? valueBuilder = entry.valueBuilder;
        if (valueBuilder != null) {
          return valueBuilder(column);
        }

        // The first series still shown, skipping series hidden through the
        // chart legend so the value always has an on-plot mark.
        final Set<String> hiddenIds = _hiddenSeriesByEntry[index] ?? const <String>{};
        for (final YgChartSeries series in entry.series) {
          if (hiddenIds.contains(series.id)) {
            continue;
          }
          if (column >= series.values.length || series.values[column].isNaN) {
            return null;
          }

          return '${_formatValue(series.values[column])} ${series.unit}'.trimRight();
        }

        return null;
    }
  }

  /// A chart value without decimal noise: "2.5 kW" but "3 kW".
  static String _formatValue(double value) {
    final String text = value.toStringAsFixed(1);

    return text.endsWith('.0') ? text.substring(0, text.length - 2) : text;
  }

  /// The scrubbed [fraction] as a value on the shared time span.
  double _positionOf(double fraction) {
    return widget.start + fraction * (widget.end - widget.start);
  }

  /// Horizontal insets aligning all plots: the widest natural axis gutters
  /// across the chart entries.
  ///
  /// Timelines are padded by these and charts get them as their minimum
  /// plot insets, so every plot spans the same columns of pixels. Zero
  /// until the charts painted for the first time, and always zero for
  /// timeline-only containers.
  (double, double) get _plotInsets {
    double left = 0.0;
    double right = 0.0;
    for (final YgChartLayout layout in _chartLayouts.values) {
      left = math.max(left, layout.naturalLeftInset ?? 0.0);
      right = math.max(right, layout.naturalRightInset ?? 0.0);
    }

    return (left, right);
  }

  /// Keeps one layout per chart entry, listening for gutter changes.
  void _syncChartLayouts() {
    final Set<int> chartIndexes = <int>{
      for (final (int index, YgChartContainerEntry entry) in widget.entries.indexed)
        if (entry is YgChartContainerChart) index,
    };

    _chartLayouts.removeWhere((int index, YgChartLayout layout) {
      if (chartIndexes.contains(index)) {
        return false;
      }

      layout.removeListener(_onChartLayoutChanged);
      layout.dispose();

      return true;
    });
    _hiddenSeriesByEntry.removeWhere((int index, Set<String> ids) => !chartIndexes.contains(index));

    for (final int index in chartIndexes) {
      _chartLayouts.putIfAbsent(index, () => YgChartLayout()..addListener(_onChartLayoutChanged));
    }
  }

  /// Re-applies the plot insets after a chart re-measured its gutters.
  ///
  /// The layouts notify after the frame that changed them, so rebuilding
  /// here is safe, and only an actual inset change rebuilds at all. The
  /// rebuild converges: the insets passed down do not change the natural
  /// gutter widths reported back.
  void _onChartLayoutChanged() {
    if (mounted && _plotInsets != _appliedPlotInsets) {
      setState(() {});
    }
  }

  /// Records series hidden through the legend of the chart entry at
  /// [index], see [_valueTextAt].
  void _onSeriesToggled(int index, YgChartSeries series, bool visible) {
    setState(() {
      final Set<String> hiddenIds = _hiddenSeriesByEntry.putIfAbsent(index, () => <String>{});
      if (visible) {
        hiddenIds.remove(series.id);
      } else {
        hiddenIds.add(series.id);
      }
    });
  }

  void _updateScrubFraction(Offset localPosition) {
    final Size? size = context.size;
    if (size == null) {
      return;
    }

    final (double leftInset, double rightInset) = _appliedPlotInsets;
    final double plotWidth = size.width - leftInset - rightInset;
    if (plotWidth <= 0.0) {
      return;
    }

    // The plots of all entries are aligned, so the pressed fraction maps to
    // the same moment no matter which entry is pressed.
    final double fraction = _snapFraction(
      math.max(0.0, math.min(1.0, (localPosition.dx - leftInset) / plotWidth)),
    );

    if (fraction != _scrubFraction) {
      setState(() => _scrubFraction = fraction);
    }
  }

  /// Snaps [fraction] to the center of the column under it on the chart
  /// entry with the most columns.
  ///
  /// The chart painters snap their indicator to a column center anyway, so
  /// without this the continuous timeline handles would sit up to half a
  /// column off the chart handles. Timeline-only containers keep the
  /// continuous fraction.
  double _snapFraction(double fraction) {
    int columnCount = 0;
    for (final YgChartContainerEntry entry in widget.entries) {
      if (entry is YgChartContainerChart) {
        columnCount = math.max(columnCount, entry.xLabels.length);
      }
    }
    if (columnCount == 0) {
      return fraction;
    }

    return (YgChartPainter.columnAt(fraction, columnCount) + 0.5) / columnCount;
  }

  void _clearScrubFraction() {
    if (_scrubFraction != null) {
      setState(() => _scrubFraction = null);
    }
  }

  bool _debugValidateEntries() {
    assert(
      widget.entries.isNotEmpty && widget.entries.length <= YgChartContainer.maxEntries,
      'YgChartContainer holds 1 to ${YgChartContainer.maxEntries} entries, '
      'got ${widget.entries.length}.',
    );
    assert(
      widget.end > widget.start,
      'YgChartContainer end (${widget.end}) must be greater than start '
      '(${widget.start}).',
    );

    return true;
  }
}
