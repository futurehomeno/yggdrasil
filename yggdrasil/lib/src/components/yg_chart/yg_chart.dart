import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_chart/models/_models.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_chart_event_marker_badge.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_chart_event_rail.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_chart_legend.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_colors.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_data_manager.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_painter.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Animated chart rendering multiple data series as bars and lines.
///
/// - Bar, line and band series share one canvas. Bar series on the same axis
///   are stacked, line series are drawn on top of the bars.
/// - Band series render a translucent area between a lower and upper bound
///   with their values as the center line, for example the average of
///   multiple temperature sensors inside their min-max envelope. The bounds
///   are passed precomputed, see [YgChartSeries.lowerValues].
/// - Stepped area series render a stepped line resembling bars with the
///   area down to the zero line filled translucently, for example power
///   drawn over a day. Each value holds over the full width of its slot.
/// - Negative values are supported and drawn below the zero line.
/// - Series can be assigned to a secondary right axis (for example energy
///   consumption in kWh on the left and energy price on the right), see
///   [YgChartSeries.axis]. The zero lines of both axes always align.
/// - Changes to the data, including the resulting axis ranges, are animated.
/// - Series without an explicit color get one assigned from [YgChartColors].
/// - A tappable legend below the chart toggles individual series on and off.
/// - Long pressing the chart shows a tooltip with the exact values of the
///   pressed column, rendered by [tooltipBuilder].
/// - Events (for example device errors) can be marked per column with
///   tappable badges in the upper part of the plot, see [eventMarkers].
/// - Events too numerous for badges can be shown on an event density rail
///   between the plot and the x-axis labels, where dragging selects a one
///   column wide band; the selected band and the plot column above it are
///   highlighted as one bar, see [railEvents] and [selectedRailBand].
/// - Inside a [YgChartContainer] the chart is scrubbed externally and its
///   plot aligned with the other entries, see [scrubFraction] and
///   [minLeftPlotInset].
class YgChart extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgChart({
    super.key,
    required this.series,
    required this.xLabels,
    this.size = YgChartSize.medium,
    this.showLegend = true,
    this.leftAxisSnap,
    this.rightAxisSnap,
    this.eventMarkers = const <YgChartEventMarker>[],
    this.selectedEventMarkerIndex,
    this.onEventMarkerTap,
    this.railEvents = const <YgChartRailEvent>[],
    this.selectedRailBand,
    this.onRailBandSelected,
    this.onSeriesToggled,
    this.tooltipBuilder,
    this.scrubFraction,
    this.minLeftPlotInset = 0.0,
    this.minRightPlotInset = 0.0,
    this.layout,
  });

  /// The data series shown on the chart.
  ///
  /// The order determines the stacking order of bar series and the order of
  /// the legend. Every series must have one value per entry in [xLabels],
  /// see [YgChartSeries].
  final List<YgChartSeries> series;

  /// Labels of the horizontal axis, one per value index.
  ///
  /// When there is not enough horizontal space only every n-th label is
  /// shown.
  final List<String> xLabels;

  /// Size of the chart canvas, see [YgChartSize].
  final YgChartSize size;

  /// Whether the tappable legend is shown below the chart.
  final bool showLegend;

  /// Snaps the bounds of the left axis to multiples of this value when the
  /// axis zooms in on its data (line series only, all values above zero).
  ///
  /// Without snapping such an axis hugs the data as tightly as possible,
  /// which makes charts of the same kind hard to compare - two room
  /// temperature charts might show 26..27 and 21..24. Snapping both to
  /// multiples of e.g. 5.0 renders them as 25..30 and 20..25 instead.
  ///
  /// Zero-anchored axes (any bars, or values at or below zero) are not
  /// affected. When null the axis is not snapped.
  final double? leftAxisSnap;

  /// Snaps the bounds of the right axis, see [leftAxisSnap].
  final double? rightAxisSnap;

  /// Event badges shown in the upper part of the plot, at most one per
  /// column, see [YgChartEventMarker].
  final List<YgChartEventMarker> eventMarkers;

  /// Column index of the selected event marker, drawn with a ring around
  /// its badge.
  ///
  /// The selection is owned by the caller: react to [onEventMarkerTap],
  /// store the selection and render the event details wherever fits (for
  /// example a list tile below the chart). When null no marker is marked as
  /// selected.
  final int? selectedEventMarkerIndex;

  /// Called with the tapped event marker.
  ///
  /// The chart does not change its own state; update
  /// [selectedEventMarkerIndex] (and for example the detail view) in
  /// response.
  final ValueChanged<YgChartEventMarker>? onEventMarkerTap;

  /// Events shown as ticks on the event density rail between the plot and
  /// the x-axis labels, see [YgChartRailEvent].
  ///
  /// Meant for events too numerous to mark with [eventMarkers]. When empty
  /// no rail is shown.
  final List<YgChartRailEvent> railEvents;

  /// Index of the column band selected on the event density rail.
  ///
  /// The band is outlined and tinted on the rail and its column is washed
  /// over the full plot height, so the whole bar reads as selected.
  ///
  /// Like [selectedEventMarkerIndex] the selection is owned by the caller:
  /// react to [onRailBandSelected], store the selection and render the
  /// events of the band wherever fits. When null no band is marked.
  final int? selectedRailBand;

  /// Called with the band under the pointer while tapping or dragging along
  /// the event density rail.
  ///
  /// Only called when the band changes; update [selectedRailBand] in
  /// response.
  final ValueChanged<int>? onRailBandSelected;

  /// Called when a series is hidden or shown through the legend.
  final void Function(YgChartSeries series, bool visible)? onSeriesToggled;

  /// Builds the tooltip shown while long pressing the chart.
  ///
  /// Called with the exact values of the visible series at the pressed
  /// column, see [YgChartTooltipData]. The returned widget is shown above
  /// the plot and horizontally follows the pressed column. When null the
  /// chart has no tooltip interaction.
  final YgChartTooltipBuilder? tooltipBuilder;

  /// Fraction (0..1) of the plot width an external scrub indicator is
  /// drawn at: the accent colored capsule handle over the full plot
  /// height ([YgChartScrubHandle]), exactly at the given fraction so it
  /// stays aligned across charts, with a dot where each line series
  /// crosses it.
  ///
  /// Driven by a wrapping [YgChartContainer], which owns the long press
  /// gesture; combine with a null [tooltipBuilder] so the chart does not
  /// compete for the gesture. When null no indicator is drawn.
  final double? scrubFraction;

  /// Lower bounds for the horizontal plot insets, so a [YgChartContainer]
  /// can align the plots of all of its charts to the widest axis gutters.
  ///
  /// The chart never shrinks its gutters below what its own axis labels
  /// need. Zero by default.
  final double minLeftPlotInset;
  final double minRightPlotInset;

  /// Layout the plot geometry is reported through, owned by the caller.
  ///
  /// A [YgChartContainer] passes one per chart to read the natural axis
  /// gutter widths, see [YgChartLayout.naturalLeftInset]. When null the
  /// chart keeps its geometry to itself.
  final YgChartLayout? layout;

  @override
  State<YgChart> createState() => _YgChartState();
}

class _YgChartState extends State<YgChart> with TickerProviderStateMixin {
  /// The controller runs linearly over this duration; easing happens per
  /// channel in [YgChartDataManager.applyAnimationValue], so toggling a line
  /// series can sequence its fade before the axis movement.
  static const Duration _animationDuration = Duration(milliseconds: 700);

  /// Roughly one axis value step per this many pixels of plot height.
  static const double _axisStepHeight = 40.0;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _animationDuration,
    value: 1.0,
  );
  final YgChartDataManager _dataManager = YgChartDataManager();
  final Set<String> _hiddenSeriesIds = <String>{};

  /// Index of the long pressed column the tooltip is shown for.
  int? _selectedIndex;

  /// Geometry of the last paint, used to map gestures to value indexes.
  ///
  /// Only used when the caller does not pass [YgChart.layout]; an external
  /// layout is owned and disposed by the caller.
  final YgChartLayout _ownLayout = YgChartLayout();

  YgChartLayout get _layout => widget.layout ?? _ownLayout;

  /// Laid out label text, reused across the paints of an animation.
  final YgChartTextLayoutCache _textCache = YgChartTextLayoutCache();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncData();
  }

  @override
  void didUpdateWidget(YgChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncData();
  }

  @override
  void dispose() {
    _controller.dispose();
    _ownLayout.dispose();
    _textCache.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<YgChartSeries> resolvedSeries = _resolveSeriesColors();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: widget.size.height,
          child: _buildCanvas(context, resolvedSeries),
        ),
        if (widget.showLegend && resolvedSeries.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: context.tokens.dimensions.xxs),
            child: YgChartLegend(
              series: resolvedSeries,
              hiddenSeriesIds: _hiddenSeriesIds,
              onSeriesTap: _toggleSeries,
            ),
          ),
      ],
    );
  }

  Widget _buildCanvas(BuildContext context, List<YgChartSeries> resolvedSeries) {
    final YgColor colors = context.tokens.colors;
    final int? selectedIndex = _selectedIndex;
    final YgChartTooltipBuilder? tooltipBuilder = widget.tooltipBuilder;
    final bool hasTooltip = tooltipBuilder != null;

    final Rect? plotRect = _layout.plotRect;
    final Size? canvasSize = _layout.canvasSize;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onLongPressStart: hasTooltip
                ? (LongPressStartDetails details) => _updateTooltipSelection(details.localPosition)
                : null,
            onLongPressMoveUpdate: hasTooltip
                ? (LongPressMoveUpdateDetails details) => _updateTooltipSelection(details.localPosition)
                : null,
            onLongPressEnd: hasTooltip ? (LongPressEndDetails details) => _clearTooltipSelection() : null,
            onLongPressCancel: hasTooltip ? _clearTooltipSelection : null,
            child: RepaintBoundary(
              child: CustomPaint(
                painter: YgChartPainter(
                  dataManager: _dataManager,
                  animation: _controller,
                  xLabels: widget.xLabels,
                  leftUnit: _unitOf(YgChartAxis.left),
                  rightUnit: _unitOf(YgChartAxis.right),
                  axisTextStyle: context.tokens.textStyles.caption1Regular.copyWith(
                    color: colors.textWeak,
                  ),
                  gridColor: colors.borderDefault.withValues(alpha: 0.4),
                  baselineColor: colors.borderDefault,
                  layout: _layout,
                  textCache: _textCache,
                  bottomInset: _railInset,
                  selectedIndex: hasTooltip ? selectedIndex : null,
                  selectionColor: colors.borderDefault,
                  highlightedIndex: widget.selectedRailBand,
                  highlightColor: colors.textDefault.withValues(alpha: 0.08),
                  minLeftInset: widget.minLeftPlotInset,
                  minRightInset: widget.minRightPlotInset,
                  scrubFraction: widget.scrubFraction,
                  scrubColor: YgChartScrubHandle.colorOf(context),
                  scrubRingColor: YgChartScrubHandle.ringColorOf(context),
                ),
              ),
            ),
          ),
        ),
        if (widget.eventMarkers.isNotEmpty && widget.xLabels.isNotEmpty)
          Positioned.fill(
            child: ListenableBuilder(
              // The plot geometry is only known after the first paint and
              // moves while the axis gutters animate; the layout notifies
              // after every frame that changed it.
              listenable: _layout,
              builder: (BuildContext context, Widget? child) => _buildEventMarkers(),
            ),
          ),
        if (widget.railEvents.isNotEmpty && widget.xLabels.isNotEmpty)
          Positioned.fill(
            child: ListenableBuilder(
              listenable: _layout,
              builder: (BuildContext context, Widget? child) => _buildEventRail(context),
            ),
          ),
        if (tooltipBuilder != null && selectedIndex != null && plotRect != null && canvasSize != null)
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedAlign(
                duration: context.defaults.animationDuration,
                curve: context.defaults.animationCurve,
                alignment: Alignment(
                  _tooltipAlignmentX(selectedIndex, plotRect, canvasSize.width),
                  -1.0,
                ),
                child: tooltipBuilder(
                  context,
                  _tooltipDataFor(selectedIndex, resolvedSeries),
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// The event marker badges, positioned over their columns in the upper
  /// part of the plot.
  Widget _buildEventMarkers() {
    final Rect? plotRect = _layout.plotRect;
    if (plotRect == null || plotRect.width <= 0.0) {
      return const SizedBox.shrink();
    }

    final double slotWidth = plotRect.width / widget.xLabels.length;

    return Stack(
      children: <Widget>[
        for (final YgChartEventMarker marker in widget.eventMarkers)
          Positioned(
            left:
                plotRect.left +
                (marker.index + 0.5) * slotWidth -
                YgChartEventMarkerBadge.diameter / 2.0 -
                YgChartEventMarkerBadge.tapPadding,
            top: plotRect.top - YgChartEventMarkerBadge.tapPadding,
            child: YgChartEventMarkerBadge(
              key: ValueKey<String>('YgChartEventMarker-${marker.index}'),
              marker: marker,
              selected: marker.index == widget.selectedEventMarkerIndex,
              onTap: widget.onEventMarkerTap,
            ),
          ),
      ],
    );
  }

  /// Extra canvas height reserved between the plot and the x-axis labels
  /// for the event density rail.
  double get _railInset => widget.railEvents.isEmpty ? 0.0 : YgChartEventRail.plotSpacing + YgChartEventRail.height;

  /// The event density rail, positioned between the plot and the x-axis
  /// labels.
  Widget _buildEventRail(BuildContext context) {
    final Rect? plotRect = _layout.plotRect;
    if (plotRect == null || plotRect.width <= 0.0) {
      return const SizedBox.shrink();
    }

    final YgColor colors = context.tokens.colors;

    return Stack(
      children: <Widget>[
        Positioned(
          left: plotRect.left,
          top: plotRect.bottom + YgChartEventRail.plotSpacing,
          width: plotRect.width,
          height: YgChartEventRail.height,
          child: YgChartEventRail(
            events: widget.railEvents,
            bandCount: widget.xLabels.length,
            trackColor: colors.backgroundWeak,
            defaultEventColor: colors.interactiveHighlightDefault,
            selectionColor: colors.textDefault,
            selectedBand: widget.selectedRailBand,
            bandSemanticValues: widget.xLabels,
            onBandSelected: widget.onRailBandSelected,
          ),
        ),
      ],
    );
  }

  bool _debugValidateRailEvents() {
    for (final YgChartRailEvent event in widget.railEvents) {
      assert(
        event.position >= 0.0 && event.position <= widget.xLabels.length,
        'YgChart rail event position ${event.position} is outside of the '
        'x-axis range (0..${widget.xLabels.length}).',
      );
    }

    final int? selectedRailBand = widget.selectedRailBand;
    assert(
      selectedRailBand == null || (selectedRailBand >= 0 && selectedRailBand < widget.xLabels.length),
      'YgChart selectedRailBand $selectedRailBand is outside of the xLabel '
      'range (0..${widget.xLabels.length - 1}).',
    );

    return true;
  }

  bool _debugValidateEventMarkers() {
    final Set<int> markerIndexes = <int>{};

    for (final YgChartEventMarker marker in widget.eventMarkers) {
      assert(
        marker.index >= 0 && marker.index < widget.xLabels.length,
        'YgChart event marker index ${marker.index} is outside of the xLabel '
        'range (0..${widget.xLabels.length - 1}).',
      );
      assert(
        markerIndexes.add(marker.index),
        'YgChart allows at most one event marker per column, found multiple '
        'for index ${marker.index}.',
      );
      assert(
        marker.count >= 1,
        'YgChart event marker at index ${marker.index} must stand for at '
        'least one event.',
      );
    }

    return true;
  }

  /// Amount of value steps shown on the axes, based on the chart height.
  int get _tickCount {
    final double plotHeight = widget.size.height - YgChartPainter.unitRowHeight - YgChartPainter.xLabelRowHeight;

    return math.max(3, plotHeight ~/ _axisStepHeight);
  }

  void _syncData() {
    assert(_debugValidateSeries());
    assert(_debugValidateEventMarkers());
    assert(_debugValidateRailEvents());

    final int? selectedIndex = _selectedIndex;
    if (selectedIndex != null && selectedIndex >= widget.xLabels.length) {
      _selectedIndex = null;
    }

    // Hidden state only applies to series that still exist; without this a
    // series removed while hidden would silently come back hidden when a
    // series with the same id is added again later.
    _hiddenSeriesIds.removeWhere(
      (String id) => !widget.series.any((YgChartSeries series) => series.id == id),
    );

    final List<YgChartSeries> visibleSeries = _resolveSeriesColors()
        .where((YgChartSeries series) => !_hiddenSeriesIds.contains(series.id))
        .toList();

    final bool changed = _dataManager.updateData(
      visibleSeries,
      valueCount: widget.xLabels.length,
      tickCount: _tickCount,
      leftAxisSnap: widget.leftAxisSnap,
      rightAxisSnap: widget.rightAxisSnap,
    );

    if (changed) {
      _controller.stop();
      _controller.value = 0.0;
      _controller.animateTo(
        1.0,
        duration: _animationDuration,
      );
    }
  }

  /// The series with their color filled in.
  ///
  /// Colors are assigned based on the position in the full series list, so a
  /// series keeps its color when other series are hidden through the legend.
  List<YgChartSeries> _resolveSeriesColors() {
    final List<Color> colors = YgChartColors.resolveAutoColors(
      context,
      <Color?>[for (final YgChartSeries series in widget.series) series.color],
    );

    return <YgChartSeries>[
      for (final (int index, YgChartSeries series) in widget.series.indexed)
        series.color != null ? series : series.copyWith(color: colors[index]),
    ];
  }

  /// Unit of [axis], or null when no series is assigned to it.
  ///
  /// Based on the full series list, so the axis does not disappear when its
  /// series are temporarily hidden through the legend.
  String? _unitOf(YgChartAxis axis) {
    for (final YgChartSeries series in widget.series) {
      if (series.axis == axis) {
        return series.unit;
      }
    }

    return null;
  }

  void _toggleSeries(YgChartSeries series) {
    setState(() {
      if (!_hiddenSeriesIds.remove(series.id)) {
        _hiddenSeriesIds.add(series.id);
      }
    });

    _syncData();
    widget.onSeriesToggled?.call(series, !_hiddenSeriesIds.contains(series.id));
  }

  void _updateTooltipSelection(Offset localPosition) {
    final Rect? plotRect = _layout.plotRect;
    if (plotRect == null || plotRect.width <= 0.0 || widget.xLabels.isEmpty) {
      return;
    }

    final int index = YgChartPainter.columnAt(
      (localPosition.dx - plotRect.left) / plotRect.width,
      widget.xLabels.length,
    );

    if (index != _selectedIndex) {
      setState(() => _selectedIndex = index);
    }
  }

  void _clearTooltipSelection() {
    if (_selectedIndex != null) {
      setState(() => _selectedIndex = null);
    }
  }

  YgChartTooltipData _tooltipDataFor(int index, List<YgChartSeries> resolvedSeries) {
    final List<YgChartTooltipEntry> entries = resolvedSeries
        .where((YgChartSeries series) => !_hiddenSeriesIds.contains(series.id))
        .map<YgChartTooltipEntry>(
          (YgChartSeries series) {
            final List<double>? lowerValues = series.lowerValues;
            final List<double>? upperValues = series.upperValues;

            return YgChartTooltipEntry(
              series: series,
              value: index < series.values.length ? series.values[index] : 0.0,
              lowerValue: lowerValues != null && index < lowerValues.length ? lowerValues[index] : null,
              upperValue: upperValues != null && index < upperValues.length ? upperValues[index] : null,
            );
          },
        )
        .toList();

    return YgChartTooltipData(
      index: index,
      xLabel: widget.xLabels[index],
      entries: entries,
    );
  }

  /// Horizontal [Alignment] value that keeps the tooltip near the pressed
  /// column while clamping it inside the chart bounds.
  double _tooltipAlignmentX(int index, Rect plotRect, double canvasWidth) {
    if (canvasWidth <= 0.0 || widget.xLabels.isEmpty) {
      return 0.0;
    }

    final double slotWidth = plotRect.width / widget.xLabels.length;
    final double columnCenterX = plotRect.left + (index + 0.5) * slotWidth;
    final double alignmentX = (columnCenterX / canvasWidth) * 2.0 - 1.0;

    return math.max(-1.0, math.min(1.0, alignmentX));
  }

  bool _debugValidateSeries() {
    final Set<String> seriesIds = <String>{};
    final Map<YgChartAxis, String> unitPerAxis = <YgChartAxis, String>{};

    for (final YgChartSeries series in widget.series) {
      assert(
        seriesIds.add(series.id),
        'YgChart series ids must be unique, found duplicate "${series.id}".',
      );
      assert(
        series.values.length == widget.xLabels.length,
        'YgChart series "${series.id}" has ${series.values.length} values, '
        'expected one per xLabel (${widget.xLabels.length}).',
      );

      if (series.type == YgChartSeriesType.band) {
        assert(
          series.lowerValues != null && series.upperValues != null,
          'YgChart band series "${series.id}" must provide lowerValues and '
          'upperValues.',
        );
        assert(
          (series.lowerValues ?? const <double>[]).length == widget.xLabels.length &&
              (series.upperValues ?? const <double>[]).length == widget.xLabels.length,
          'YgChart band series "${series.id}" bounds must have one value per '
          'xLabel (${widget.xLabels.length}).',
        );
      } else {
        assert(
          series.lowerValues == null && series.upperValues == null,
          'YgChart series "${series.id}" of type ${series.type.name} must '
          'not provide band bounds.',
        );
      }

      final String? axisUnit = unitPerAxis[series.axis];
      assert(
        axisUnit == null || axisUnit == series.unit,
        'All YgChart series on the ${series.axis.name} axis must share the '
        'same unit, found "$axisUnit" and "${series.unit}".',
      );
      unitPerAxis[series.axis] = series.unit;
    }

    return true;
  }
}
