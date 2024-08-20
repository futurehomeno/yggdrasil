import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';

class IntervalData {
  const IntervalData({
    required this.intervals,
    required this.range,
  });

  final int intervals;
  final Range range;
}

abstract class IntervalProvider {
  const IntervalProvider();

  IntervalData getIntervalData({
    required Range range,
    required double length,
  });
}
