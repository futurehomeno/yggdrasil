import '../range.dart';
import 'data_point.dart';

typedef AnyDataset = Dataset<num, DataPoint<num>>;

class Dataset<N extends num, P extends DataPoint<N>> {
  const Dataset({
    required this.indexRange,
    required this.points,
    required this.valueRange,
  });

  final List<P> points;
  final Range<N> indexRange;
  final DoubleRange valueRange;
}
