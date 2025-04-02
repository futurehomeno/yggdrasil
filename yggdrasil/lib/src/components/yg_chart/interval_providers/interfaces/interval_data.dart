import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

class IntervalData {
  const IntervalData({
    required this.intervals,
    required this.range,
    required this.precision,
  });

  final List<YgInterval> intervals;
  final DoubleRange range;
  final int precision;

  /// The interval step precision.
  ///
  /// Assuming the there are 4 intervals, with a range of 0 to 1, the step size
  /// would be 0.25, which has 2 digits of precision. If the range starts at
  /// 0.001, the precision will always be at least 3 digits.
  // int get precision {
  //   return max(
  //     (range.length / intervals).precision,
  //     range.start.precision,
  //   );
  // }
}
