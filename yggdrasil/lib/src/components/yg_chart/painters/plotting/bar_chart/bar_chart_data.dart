import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';
import 'package:yggdrasil/src/components/yg_chart/helpers/data_helpers.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_ranges.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/bar_chart/bar.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/bar_chart/indexed_bar.dart';

class BarChartData extends DataSet<int, IndexedBar> {
  const BarChartData({
    required super.indexRange,
    required super.points,
    required super.valueRange,
  });

  factory BarChartData.fromIndexedBars(List<IndexedBar> bars) {
    final DataRanges<int> ranges = DataHelpers.getDataRanges(bars);

    return BarChartData(
      indexRange: ranges.indexRange,
      points: bars,
      valueRange: ranges.valueRange,
    );
  }

  factory BarChartData.fromBars(List<Bar> bars) {
    final List<IndexedBar> indexedBars = <IndexedBar>[];

    for (int i = 0; i < bars.length; i++) {
      indexedBars.add(
        IndexedBar(
          index: i,
          value: bars[i].value,
          variant: bars[i].variant,
        ),
      );
    }

    return BarChartData.fromIndexedBars(indexedBars);
  }

  factory BarChartData.fromValues({
    required DataVariant variant,
    required List<double> values,
  }) {
    final List<IndexedBar> bars = <IndexedBar>[];

    for (int i = 0; i < values.length; i++) {
      bars.add(
        IndexedBar(
          index: i,
          value: values[i],
          variant: variant,
        ),
      );
    }

    return BarChartData.fromIndexedBars(bars);
  }
}
