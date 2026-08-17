import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_chart/models/_models.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_chart_legend.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_colors.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_data_manager.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_painter.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Animated chart rendering multiple data series as bars and lines.
///
/// - Bar and line series share one canvas. Bar series on the same axis are
///   stacked, line series are drawn on top of the bars.
/// - Negative values are supported and drawn below the zero line.
/// - Series can be assigned to a secondary right axis (for example energy
///   consumption in kWh on the left and energy price on the right), see
///   [YgChartSeries.axis]. The zero lines of both axes always align.
/// - Changes to the data, including the resulting axis ranges, are animated.
/// - Series without an explicit color get one assigned from [YgChartColors].
/// - A tappable legend below the chart toggles individual series on and off.
/// - Long pressing the chart shows a tooltip with the exact values of the
///   pressed column, rendered by [tooltipBuilder].
class YgChart extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgChart({
    super.key,
    required this.series,
    required this.xLabels,
    this.size = YgChartSize.medium,
    this.showLegend = true,
    this.onSeriesToggled,
    this.tooltipBuilder,
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

  /// Called when a series is hidden or shown through the legend.
  final void Function(YgChartSeries series, bool visible)? onSeriesToggled;

  /// Builds the tooltip shown while long pressing the chart.
  ///
  /// Called with the exact values of the visible series at the pressed
  /// column, see [YgChartTooltipData]. The returned widget is shown above
  /// the plot and horizontally follows the pressed column. When null the
  /// chart has no tooltip interaction.
  final YgChartTooltipBuilder? tooltipBuilder;

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
  final YgChartLayout _layout = YgChartLayout();

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
    final bool hasTooltip = widget.tooltipBuilder != null;

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
                  selectedIndex: hasTooltip ? selectedIndex : null,
                  selectionColor: colors.borderDefault,
                ),
              ),
            ),
          ),
        ),
        if (hasTooltip && selectedIndex != null && plotRect != null && canvasSize != null)
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedAlign(
                duration: context.defaults.animationDuration,
                curve: context.defaults.animationCurve,
                alignment: Alignment(
                  _tooltipAlignmentX(selectedIndex, plotRect, canvasSize.width),
                  -1.0,
                ),
                child: widget.tooltipBuilder!(
                  context,
                  _tooltipDataFor(selectedIndex, resolvedSeries),
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Amount of value steps shown on the axes, based on the chart height.
  int get _tickCount {
    final double plotHeight = widget.size.height - YgChartPainter.unitRowHeight - YgChartPainter.xLabelRowHeight;

    return math.max(3, plotHeight ~/ _axisStepHeight);
  }

  void _syncData() {
    assert(_debugValidateSeries());

    final int? selectedIndex = _selectedIndex;
    if (selectedIndex != null && selectedIndex >= widget.xLabels.length) {
      _selectedIndex = null;
    }

    final List<YgChartSeries> visibleSeries = _resolveSeriesColors()
        .where((YgChartSeries series) => !_hiddenSeriesIds.contains(series.id))
        .toList();

    final bool changed = _dataManager.updateData(
      visibleSeries,
      valueCount: widget.xLabels.length,
      tickCount: _tickCount,
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
    final List<Color> palette = YgChartColors.categoricalOf(context);
    int autoColorIndex = 0;

    return widget.series.map<YgChartSeries>((YgChartSeries series) {
      if (series.color != null) {
        return series;
      }

      final Color color = palette[autoColorIndex % palette.length];
      autoColorIndex++;

      return series.copyWith(color: color);
    }).toList();
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

    final double slotWidth = plotRect.width / widget.xLabels.length;
    final int rawIndex = ((localPosition.dx - plotRect.left) / slotWidth).floor();
    final int index = math.max(0, math.min(widget.xLabels.length - 1, rawIndex));

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
          (YgChartSeries series) => YgChartTooltipEntry(
            series: series,
            value: index < series.values.length ? series.values[index] : 0.0,
          ),
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
