import 'data_point.dart';
import 'range.dart';

typedef AnyDataSet = DataSet<num, DataPoint<num>>;

class DataSet<N extends num, P extends DataPoint<N>> {
  const DataSet({
    required this.indexRange,
    required this.points,
    required this.valueRange,
  });

  final List<P> points;
  final Range<N> indexRange;
  final DoubleRange valueRange;
}
