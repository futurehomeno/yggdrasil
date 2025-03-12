import 'package:yggdrasil/src/components/yg_chart/helpers/data_helpers.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_ranges.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/models/bar_segment.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/models/segmented_bar.dart';

class SegmentedBarChartData extends DataSet<int, SegmentedBar> {
  const SegmentedBarChartData({
    required super.indexRange,
    required super.points,
    required super.valueRange,
  });

  factory SegmentedBarChartData.fromSegmentedBars(List<SegmentedBar> bars) {
    final DataRanges<int> ranges = DataHelpers.getDataRanges(bars);

    return SegmentedBarChartData(
      indexRange: ranges.indexRange,
      points: bars,
      valueRange: ranges.valueRange,
    );
  }

  factory SegmentedBarChartData.fromSegmentsList(List<List<BarSegment>> segmentsList) {
    final List<SegmentedBar> bars = <SegmentedBar>[];

    for (int i = 0; i < segmentsList.length; i++) {
      bars.add(
        SegmentedBar.fromSegments(
          index: i,
          segments: segmentsList[i],
        ),
      );
    }

    return SegmentedBarChartData.fromSegmentedBars(bars);
  }
}
