import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval_data.dart';
import 'package:yggdrasil/src/components/yg_chart/models/formatters/yg_value_formatter.dart';

class YgSimpleValueFormatter extends YgValueFormatter {
  const YgSimpleValueFormatter({
    this.precision,
  });

  final double? precision;

  @override
  String format({
    required double value,
    required IntervalData intervalData,
    required int precision,
  }) {
    return value.toStringAsFixed(intervalData.precision);
  }

  @override
  String formatWithMetric({
    required double value,
    required String metric,
    required int precision,
    required IntervalData intervalData,
  }) {
    final String formatted = format(
      value: value,
      intervalData: intervalData,
      precision: precision,
    );

    return '$formatted $metric';
  }
}
