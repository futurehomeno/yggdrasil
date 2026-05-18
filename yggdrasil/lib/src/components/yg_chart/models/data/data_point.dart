import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

class DataPoint<N extends num> {
  DataPoint({
    required this.index,
    required double value,
  }) : value = DoubleRange.point(value);

  const DataPoint.range({
    required this.index,
    required this.value,
  });

  final N index;
  final DoubleRange value;
}
