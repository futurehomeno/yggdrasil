import 'package:yggdrasil/src/components/yg_chart/models/data/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/segmented_bar_chart/models/bar_segment.dart';

class SegmentedBar extends DataPoint<int> {
  SegmentedBar({
    required super.index,
    required this.segments,
    required double value,
  }) : super.range(
          value: DoubleRange(
            end: value,
            start: 0,
          ),
        );

  factory SegmentedBar.fromSegments({
    required int index,
    required List<BarSegment> segments,
  }) {
    double value = 0;

    for (final BarSegment segment in segments) {
      value += segment.value;
    }

    return SegmentedBar(
      index: index,
      value: value,
      segments: segments,
    );
  }

  final List<BarSegment> segments;
}
