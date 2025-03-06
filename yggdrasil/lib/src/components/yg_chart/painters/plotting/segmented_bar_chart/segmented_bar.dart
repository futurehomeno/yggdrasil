import 'package:yggdrasil/src/components/yg_chart/models/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/bar_segment.dart';

class SegmentedBar extends DataPoint<int> {
  const SegmentedBar({
    required super.index,
    required super.value,
    required this.segments,
  });

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
