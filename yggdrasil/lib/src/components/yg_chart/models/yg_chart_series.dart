import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/_enums.dart';

/// A single data series rendered in a [YgChart].
class YgChartSeries {
  const YgChartSeries({
    required this.id,
    required this.label,
    required this.values,
    required this.unit,
    this.type = YgChartSeriesType.bar,
    this.axis = YgChartAxis.left,
    this.color,
  });

  /// Unique identifier of the series.
  ///
  /// Used to match series between data updates so changes can be animated,
  /// and to toggle series visibility through the legend.
  final String id;

  /// Human readable name of the series, shown in the legend.
  final String label;

  /// One value per x-axis label of the chart.
  ///
  /// Must have the same length as [YgChart.xLabels]. Negative values are
  /// supported and are drawn below the zero line.
  final List<double> values;

  /// Unit of the values, for example 'kWh' or 'kr'.
  ///
  /// Shown above the axis this series is assigned to. All series assigned to
  /// the same axis must share the same unit.
  final String unit;

  /// How the series is rendered, see [YgChartSeriesType].
  final YgChartSeriesType type;

  /// The axis this series is scaled against, see [YgChartAxis].
  final YgChartAxis axis;

  /// Color of the series.
  ///
  /// When null a color is automatically assigned from [YgChartColors] based
  /// on the position of the series in [YgChart.series].
  final Color? color;

  /// Copy of this series with the given fields replaced.
  YgChartSeries copyWith({
    Color? color,
  }) {
    return YgChartSeries(
      id: id,
      label: label,
      values: values,
      unit: unit,
      type: type,
      axis: axis,
      color: color ?? this.color,
    );
  }
}
