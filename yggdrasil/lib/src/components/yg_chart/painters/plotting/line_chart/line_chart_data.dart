import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';
import 'package:yggdrasil/src/components/yg_chart/helpers/data_helpers.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_ranges.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_set.dart';

class LineChartData extends DataSet<double, DataPoint<double>> {
  const LineChartData({
    required super.indexRange,
    required super.points,
    required super.valueRange,
    required this.variant,
  });

  factory LineChartData.fromPoints({
    required List<DataPoint<double>> points,
    required DataVariant variant,
  }) {
    final DataRanges<double> ranges = DataHelpers.getDataRanges(points);

    return LineChartData(
      indexRange: ranges.indexRange,
      points: points,
      valueRange: ranges.valueRange,
      variant: variant,
    );
  }

  factory LineChartData.fromValues({
    required List<double> values,
    required DataVariant variant,
  }) {
    final List<DataPoint<double>> points = <DataPoint<double>>[];

    for (int i = 0; i < values.length; i++) {
      points.add(
        DataPoint<double>(
          index: i.toDouble(),
          value: values[i],
        ),
      );
    }

    return LineChartData.fromPoints(
      points: points,
      variant: variant,
    );
  }

  final DataVariant variant;
}
