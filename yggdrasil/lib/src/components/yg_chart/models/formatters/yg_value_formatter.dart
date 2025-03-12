import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval_data.dart';

abstract class YgValueFormatter {
  const YgValueFormatter();

  String format(double value, IntervalData intervalData);
}
