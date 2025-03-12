import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval_data.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

abstract class YgIntervalProvider {
  const YgIntervalProvider();

  IntervalData getIntervalData({
    required DoubleRange dataRange,
    required double space,
    int? intervals,
  });
}

class YgNoIntervalProvider extends YgIntervalProvider {
  const YgNoIntervalProvider();

  @override
  IntervalData getIntervalData({
    required DoubleRange dataRange,
    required double space,
    int? intervals,
  }) {
    return IntervalData(
      intervals: 0,
      range: dataRange,
    );
  }
}
