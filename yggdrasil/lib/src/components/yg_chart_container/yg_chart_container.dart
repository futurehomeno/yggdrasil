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
///   height line with a dot per line series on chart plots. On charts the
///   indicator snaps to the column under the pressed moment.
/// - While scrubbing every subtitle shows the value at the pressed moment,
///   for example "Mode: Heat" or "Power: 2.5 kW". Defaults are the label
///   of the active state (timelines) and the first series value with its
///   unit (charts); the valueBuilder of an entry overrides the text.
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
  /// The long pressed moment on the shared time span, null while idle.
  double? _scrubPosition;

  /// One layout per chart entry, keyed by entry index, to read the natural
  /// axis gutter widths from.
  final Map<int, YgChartLayout> _chartLayouts = <int, YgChartLayout>{};

  @override
  void initState() {
    super.initState();
    _syncChartLayouts();
  }

  @override
  void didUpdateWidget(YgChartContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncChartLayouts();

    final double? scrubPosition = _scrubPosition;
    if (scrubPosition != null && (scrubPosition < widget.start || scrubPosition > widget.end)) {
      _scrubPosition = null;
    }
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

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPressStart: (LongPressStartDetails details) => _updateScrubPosition(details.localPosition),
      onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) => _updateScrubPosition(details.localPosition),
      onLongPressEnd: (LongPressEndDetails details) => _clearScrubPosition(),
      onLongPressCancel: _clearScrubPosition,
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
    final double? scrubPosition = _scrubPosition;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildSubtitle(context, entry, scrubPosition),
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
    final (double leftInset, double rightInset) = _plotInsets;

    return Padding(
      // Aligns the timeline bar with the chart plots, see _plotInsets.
      padding: EdgeInsets.only(left: leftInset, right: rightInset),
      child: CustomPaint(
        foregroundPainter: scrubFraction == null
            ? null
            : YgChartContainerIndicatorPainter(
                fraction: scrubFraction,
                barHeight: entry.size.barHeight,
                color: context.tokens.colors.backgroundAccentDefault,
                ringColor: context.tokens.colors.backgroundDefault,
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
    final (double leftInset, double rightInset) = _plotInsets;

    return YgChart(
      series: entry.series,
      xLabels: entry.xLabels,
      size: entry.size,
      showLegend: entry.showLegend,
      leftAxisSnap: entry.leftAxisSnap,
      rightAxisSnap: entry.rightAxisSnap,
      scrubFraction: _scrubFraction,
      minLeftPlotInset: leftInset,
      minRightPlotInset: rightInset,
      layout: _chartLayouts[index],
    );
  }

  /// The subtitle above the chart, with the value at the scrubbed moment
  /// appended while scrubbing.
  Widget _buildSubtitle(BuildContext context, YgChartContainerEntry entry, double? scrubPosition) {
    final YgColor colors = context.tokens.colors;
    final String? valueText = scrubPosition == null ? null : _valueTextAt(entry, scrubPosition);

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

  /// The text shown after the subtitle of [entry] for [position].
  String? _valueTextAt(YgChartContainerEntry entry, double position) {
    switch (entry) {
      case YgChartContainerTimeline():
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
        final int index = _columnIndexAt(entry, position);
        final YgChartContainerColumnValueBuilder? valueBuilder = entry.valueBuilder;
        if (valueBuilder != null) {
          return valueBuilder(index);
        }

        if (entry.series.isEmpty) {
          return null;
        }

        final YgChartSeries series = entry.series.first;
        if (index >= series.values.length || series.values[index].isNaN) {
          return null;
        }

        return '${_formatValue(series.values[index])} ${series.unit}'.trimRight();
    }
  }

  /// Index of the column of [entry] the scrubbed [position] falls into,
  /// matching the column the chart snaps its indicator to.
  int _columnIndexAt(YgChartContainerChart entry, double position) {
    final double span = widget.end - widget.start;
    final int count = entry.xLabels.length;
    if (span <= 0.0 || count == 0) {
      return 0;
    }

    final double fraction = (position - widget.start) / span;

    return math.max(0, math.min(count - 1, (fraction * count).floor()));
  }

  /// A chart value without decimal noise: "2.5 kW" but "3 kW".
  static String _formatValue(double value) {
    final String text = value.toStringAsFixed(1);

    return text.endsWith('.0') ? text.substring(0, text.length - 2) : text;
  }

  /// The scrubbed moment as a fraction (0..1) of the shared plot width.
  double? get _scrubFraction {
    final double? scrubPosition = _scrubPosition;
    final double span = widget.end - widget.start;
    if (scrubPosition == null || span <= 0.0) {
      return null;
    }

    return (scrubPosition - widget.start) / span;
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

    for (final int index in chartIndexes) {
      _chartLayouts.putIfAbsent(index, () => YgChartLayout()..addListener(_onChartLayoutChanged));
    }
  }

  /// Re-applies the plot insets after a chart re-measured its gutters.
  ///
  /// The layouts notify after the frame that changed them, so rebuilding
  /// here is safe. The rebuild converges: the insets passed down do not
  /// change the natural gutter widths reported back.
  void _onChartLayoutChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  void _updateScrubPosition(Offset localPosition) {
    final Size? size = context.size;
    if (size == null) {
      return;
    }

    final (double leftInset, double rightInset) = _plotInsets;
    final double plotWidth = size.width - leftInset - rightInset;
    if (plotWidth <= 0.0) {
      return;
    }

    // The plots of all entries are aligned, so the pressed fraction maps to
    // the same moment no matter which entry is pressed.
    final double fraction = math.max(0.0, math.min(1.0, (localPosition.dx - leftInset) / plotWidth));
    final double position = widget.start + fraction * (widget.end - widget.start);

    if (position != _scrubPosition) {
      setState(() => _scrubPosition = position);
    }
  }

  void _clearScrubPosition() {
    if (_scrubPosition != null) {
      setState(() => _scrubPosition = null);
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
