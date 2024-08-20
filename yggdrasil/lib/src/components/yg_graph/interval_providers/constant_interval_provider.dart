import 'package:yggdrasil/src/components/yg_graph/interval_providers/interval_provider.dart';
import 'package:yggdrasil/src/components/yg_graph/models/range.dart';

/// Provides a constant amount of intervals.
///
/// Simplest type of interval provider, does not scale up or down
class ConstantIntervalProvider extends IntervalProvider {
  const ConstantIntervalProvider({
    required this.intervals,
  });

  final int intervals;

  @override
  IntervalData getIntervalData({
    required Range range,
    required double length,
  }) {
    return IntervalData(
      intervals: intervals,
      range: range,
    );
  }
}
