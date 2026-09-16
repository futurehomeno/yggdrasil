import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_chart/models/_models.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_colors.dart';
import 'package:yggdrasil/src/components/yg_chart_simple/yg_chart_simple_painter.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Minimal glanceable chart without axes, grid, legend or interactions.
///
/// Meant for compact surfaces like dashboard cards, where a full [YgChart]
/// would be too heavy: a trend line with an optional caption like "Last 12 h"
/// is all that is shown. Without axes the whole canvas is the plot; the data
/// spans the full width edge to edge and is scaled to the full height with a
/// small padding at the top and bottom, see
/// [YgChartSimplePainter.verticalPaddingFraction].
///
/// - Only [YgChartSeriesType.line] and [YgChartSeriesType.band] series are
///   supported, drawn with the same look as on a [YgChart]. Band series
///   render a translucent area between a lower and upper bound with their
///   values as the center line, for example the min-max envelope of multiple
///   temperature sensors, see [YgChartSeries.lowerValues].
/// - All series share one vertical scale, computed from the data (including
///   band bounds and [referenceValue]) and by default snapped outwards to
///   multiples of [rangeSnap], so small variations read as a calm, thin
///   line instead of filling the full height. NaN values are rendered as
///   gaps.
/// - [label] is overlaid in the top left corner of the canvas.
/// - [referenceValue] is marked with a dashed horizontal line, for example a
///   thermostat setpoint on a temperature chart.
/// - Series without an explicit color get one assigned from [YgChartColors],
///   like on a [YgChart].
/// - Unlike [YgChart] the chart is not interactive and data changes are not
///   animated.
class YgChartSimple extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgChartSimple({
    super.key,
    required this.series,
    this.label,
    this.size = YgChartSize.xxxsmall,
    this.referenceValue,
    this.rangeSnap = 5.0,
  });

  /// The data series shown on the chart.
  ///
  /// Only line and band series are supported and every series must have the
  /// same amount of values, see [YgChartSeries]. Since there are no axes all
  /// series are scaled against the same range and must stay on the default
  /// [YgChartAxis.left].
  final List<YgChartSeries> series;

  /// Caption overlaid in the top left corner of the canvas, for example
  /// `Text('Last 12 h')` or a [YgTag].
  ///
  /// Plain [Text] renders in the canonical caption style (a small weak text
  /// style) through an ambient [DefaultTextStyle]; self-styled widgets like
  /// a [YgTag] are unaffected by it. The plot is not inset for the label;
  /// with the vertical padding the data stays clear of it unless the
  /// leftmost values are at the very top of the range. When null no label
  /// is shown.
  final Widget? label;

  /// Size of the chart canvas, see [YgChartSize].
  final YgChartSize size;

  /// Value marked with a dashed horizontal line, for example a thermostat
  /// setpoint on a temperature chart.
  ///
  /// The vertical scale always includes it, so the line stays visible even
  /// when the data does not reach it. When null no line is drawn.
  final double? referenceValue;

  /// Snaps the bounds of the vertical scale outwards to multiples of this
  /// value instead of hugging the data, like [YgChart.leftAxisSnap].
  ///
  /// Without snapping even tiny variations span the (nearly) full canvas
  /// height, which reads as a dramatic swing. With the default of 5.0,
  /// temperatures of e.g. 20.6..22.5 are drawn on a calm 20..25 scale
  /// instead. For data that is not negative the snapped scale never extends
  /// below zero. Pass null to let the scale hug the data.
  final double? rangeSnap;

  @override
  Widget build(BuildContext context) {
    assert(_debugValidateSeries());

    final YgColor colors = context.tokens.colors;
    final Widget? label = this.label;

    return SizedBox(
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: RepaintBoundary(
              child: CustomPaint(
                painter: YgChartSimplePainter(
                  series: _resolveSeriesColors(context),
                  referenceValue: referenceValue,
                  referenceColor: colors.borderDefault,
                  rangeSnap: rangeSnap,
                ),
              ),
            ),
          ),
          if (label != null)
            Align(
              alignment: Alignment.topLeft,
              child: DefaultTextStyle(
                style: context.tokens.textStyles.paragraph3Regular.copyWith(
                  color: colors.textWeak,
                ),
                child: label,
              ),
            ),
        ],
      ),
    );
  }

  /// The series with their color filled in.
  ///
  /// Colors are assigned based on the position in the series list, the same
  /// way a [YgChart] assigns them.
  List<YgChartSeries> _resolveSeriesColors(BuildContext context) {
    final List<Color> colors = YgChartColors.resolveAutoColors(
      context,
      <Color?>[for (final YgChartSeries singleSeries in series) singleSeries.color],
    );

    return <YgChartSeries>[
      for (final (int index, YgChartSeries singleSeries) in series.indexed)
        singleSeries.color != null ? singleSeries : singleSeries.copyWith(color: colors[index]),
    ];
  }

  bool _debugValidateSeries() {
    final Set<String> seriesIds = <String>{};
    final int valueCount = series.isEmpty ? 0 : series.first.values.length;

    for (final YgChartSeries singleSeries in series) {
      assert(
        seriesIds.add(singleSeries.id),
        'YgChartSimple series ids must be unique, found duplicate "${singleSeries.id}".',
      );
      assert(
        singleSeries.type == YgChartSeriesType.line || singleSeries.type == YgChartSeriesType.band,
        'YgChartSimple only supports line and band series, series '
        '"${singleSeries.id}" is of type ${singleSeries.type.name}.',
      );
      assert(
        singleSeries.axis == YgChartAxis.left,
        'YgChartSimple has no axes; series "${singleSeries.id}" must stay on '
        'the default left axis.',
      );
      assert(
        singleSeries.values.length == valueCount,
        'All YgChartSimple series must have the same amount of values, series '
        '"${singleSeries.id}" has ${singleSeries.values.length} instead of '
        '$valueCount.',
      );

      if (singleSeries.type == YgChartSeriesType.band) {
        assert(
          singleSeries.lowerValues != null && singleSeries.upperValues != null,
          'YgChartSimple band series "${singleSeries.id}" must provide '
          'lowerValues and upperValues.',
        );
        assert(
          (singleSeries.lowerValues ?? const <double>[]).length == valueCount &&
              (singleSeries.upperValues ?? const <double>[]).length == valueCount,
          'YgChartSimple band series "${singleSeries.id}" bounds must have '
          'one value per center value ($valueCount).',
        );
      } else {
        assert(
          singleSeries.lowerValues == null && singleSeries.upperValues == null,
          'YgChartSimple series "${singleSeries.id}" of type '
          '${singleSeries.type.name} must not provide band bounds.',
        );
      }
    }

    return true;
  }
}
