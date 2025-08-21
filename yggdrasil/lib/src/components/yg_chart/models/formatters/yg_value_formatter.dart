import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval_data.dart';

abstract class YgValueFormatter {
  const YgValueFormatter();

  String format({
    required double value,
    required int precision,
    required IntervalData intervalData,
  });

  String formatWithMetric({
    required double value,
    required int precision,
    required String metric,
    required IntervalData intervalData,
  });
}
