import 'range.dart';

class DataRanges<N extends num> {
  const DataRanges({
    required this.indexRange,
    required this.valueRange,
  });

  final Range<N> indexRange;
  final DoubleRange valueRange;
}
