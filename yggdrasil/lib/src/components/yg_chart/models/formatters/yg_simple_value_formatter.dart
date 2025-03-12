import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval_data.dart';
import 'package:yggdrasil/src/components/yg_chart/models/formatters/yg_value_formatter.dart';

class YgSimpleValueFormatter extends YgValueFormatter {
  const YgSimpleValueFormatter({
    this.precision,
  });

  final double? precision;

  @override
  String format(
    double value,
    IntervalData intervalData,
  ) {
    return value.toStringAsFixed(intervalData.precision);
  }

  @override
  String formatWithMetric(
    double value,
    String metric,
    IntervalData intervalData,
  ) {
    return '${format(value, intervalData)} $metric';
  }
}
