import 'package:yggdrasil/src/components/yg_chart/models/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data_ranges.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

abstract final class DataHelpers {
  static DataRanges<N> getDataRanges<N extends num>(List<DataPoint<N>> points) {
    double maxValue = points.first.value;
    double minValue = points.first.value;
    N maxIndex = points.first.index;
    N minIndex = points.first.index;

    for (final DataPoint<N> point in points) {
      if (point.index > maxIndex) {
        maxIndex = point.index;
      }
      if (point.index < minIndex) {
        minIndex = point.index;
      }
      if (point.value > maxValue) {
        maxValue = point.value;
      }
      if (point.value < minValue) {
        minValue = point.value;
      }
    }

    return DataRanges<N>(
      indexRange: Range<N>(
        start: minIndex,
        end: maxIndex,
      ),
      valueRange: DoubleRange(
        start: minValue,
        end: maxValue,
      ),
    );
  }
}
