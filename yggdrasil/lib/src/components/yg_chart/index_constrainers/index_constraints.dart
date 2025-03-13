import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

class IndexConstraints {
  const IndexConstraints({
    required this.min,
    required this.max,
  });

  final double max;
  final double min;

  DoubleRange constrain(DoubleRange range) {
    if (range.length > max) {
      return range.withLength(max);
    }

    if (range.length < min) {
      range.withLength(min);
    }

    return range;
  }
}
