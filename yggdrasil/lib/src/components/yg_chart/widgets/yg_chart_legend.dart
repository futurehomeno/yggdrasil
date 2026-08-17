// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_chart/models/_models.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// The tappable legend of a [YgChart].
///
/// Shows one item per series, which can be tapped to hide or show the series
/// on the chart. The items are laid out on a single row that scrolls
/// horizontally when it overflows, so the legend never grows the chart
/// vertically.
class YgChartLegend extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgChartLegend({
    super.key,
    required this.series,
    required this.hiddenSeriesIds,
    required this.onSeriesTap,
  });

  /// All series of the chart, in the order they should be listed.
  final List<YgChartSeries> series;

  /// Ids of the series that are currently hidden on the chart.
  final Set<String> hiddenSeriesIds;

  /// Called with the tapped series.
  final ValueChanged<YgChartSeries> onSeriesTap;

  @override
  Widget build(BuildContext context) {
    final double spacing = context.tokens.dimensions.xxs;

    // Centered like a Wrap while the items fit; the Center makes the scroll
    // view shrink-wrap its content, so once the items overflow it fills the
    // width and scrolls instead of growing a second row.
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (int i = 0; i < series.length; i++) ...<Widget>[
              if (i > 0) SizedBox(width: spacing),
              _YgChartLegendItem(
                series: series[i],
                hidden: hiddenSeriesIds.contains(series[i].id),
                onTap: () => onSeriesTap(series[i]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _YgChartLegendItem extends StatelessWidget {
  const _YgChartLegendItem({
    required this.series,
    required this.hidden,
    required this.onTap,
  });

  static const double _barMarkerSize = 10.0;
  static const double _lineMarkerWidth = 14.0;
  static const double _lineMarkerHeight = 3.0;
  static const double _bandMarkerHeight = 10.0;

  /// Matches the fill opacity of the band on the chart canvas, see
  /// [YgChartPainter].
  static const double _bandMarkerFillOpacity = 0.2;

  final YgChartSeries series;
  final bool hidden;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final YgColor colors = context.tokens.colors;
    final Color markerColor = hidden ? colors.iconDisabled : (series.color ?? colors.iconDefault);
    final Color labelColor = hidden ? colors.textDisabled : colors.textDefault;

    return Semantics(
      button: true,
      selected: !hidden,
      label: series.label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.tokens.dimensions.xxs,
            vertical: context.tokens.dimensions.xxs,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildMarker(context, markerColor),
              SizedBox(width: context.tokens.dimensions.xxs),
              AnimatedDefaultTextStyle(
                duration: context.defaults.animationDuration,
                curve: context.defaults.animationCurve,
                style: context.tokens.textStyles.caption1Medium.copyWith(
                  color: labelColor,
                ),
                child: Text(series.label),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// The shape of the marker mirrors how the series is rendered on the
  /// chart: a circle for the pill-shaped bars and a short line for lines.
  Widget _buildMarker(BuildContext context, Color markerColor) {
    return switch (series.type) {
      YgChartSeriesType.bar => AnimatedContainer(
        duration: context.defaults.animationDuration,
        curve: context.defaults.animationCurve,
        width: _barMarkerSize,
        height: _barMarkerSize,
        decoration: BoxDecoration(
          color: markerColor,
          shape: BoxShape.circle,
        ),
      ),
      YgChartSeriesType.line => AnimatedContainer(
        duration: context.defaults.animationDuration,
        curve: context.defaults.animationCurve,
        width: _lineMarkerWidth,
        height: _lineMarkerHeight,
        decoration: BoxDecoration(
          color: markerColor,
          borderRadius: BorderRadius.circular(_lineMarkerHeight / 2.0),
        ),
      ),
      // The band marker mirrors the band on the canvas: the center line on
      // top of the translucent area.
      YgChartSeriesType.band => AnimatedContainer(
        duration: context.defaults.animationDuration,
        curve: context.defaults.animationCurve,
        width: _lineMarkerWidth,
        height: _bandMarkerHeight,
        decoration: BoxDecoration(
          color: markerColor.withValues(alpha: markerColor.a * _bandMarkerFillOpacity),
          borderRadius: BorderRadius.circular(_lineMarkerHeight),
        ),
        child: Center(
          child: AnimatedContainer(
            duration: context.defaults.animationDuration,
            curve: context.defaults.animationCurve,
            height: _lineMarkerHeight,
            decoration: BoxDecoration(
              color: markerColor,
              borderRadius: BorderRadius.circular(_lineMarkerHeight / 2.0),
            ),
          ),
        ),
      ),
    };
  }
}
