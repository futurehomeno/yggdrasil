import 'dart:math';

import 'package:yggdrasil/src/components/yg_chart/models/range.dart';
import 'package:yggdrasil/src/extensions/double_extension.dart';

class IntervalData {
  const IntervalData({
    required this.intervals,
    required this.range,
  });

  final int intervals;
  final DoubleRange range;

  /// The interval step precision.
  ///
  /// Assuming the there are 4 intervals, with a range of 0 to 1, the step size
  /// would be 0.25, which has 2 digits of precision. If the range starts at
  /// 0.001, the precision will always be at least 3 digits.
  int get precision {
    return max(
      (range.length / intervals).precision,
      range.start.precision,
    );
  }
}
