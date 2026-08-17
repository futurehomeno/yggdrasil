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
/// on the chart.
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

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: spacing,
      runSpacing: spacing,
      children: series
          .map<Widget>(
            (YgChartSeries currentSeries) => _YgChartLegendItem(
              series: currentSeries,
              hidden: hiddenSeriesIds.contains(currentSeries.id),
              onTap: () => onSeriesTap(currentSeries),
            ),
          )
          .toList(),
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
    };
  }
}
