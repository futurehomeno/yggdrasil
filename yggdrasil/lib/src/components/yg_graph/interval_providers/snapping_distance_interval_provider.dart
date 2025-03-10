import 'package:yggdrasil/src/components/yg_graph/helpers/snapping_interval_helper.dart';
import 'package:yggdrasil/src/components/yg_graph/interval_providers/interval_provider.dart';
import 'package:yggdrasil/src/components/yg_graph/models/range.dart';

/// Provides a constant amount of intervals.
///
/// Simplest type of interval provider, does not scale up or down
class SnappingDistanceIntervalProvider extends IntervalProvider {
  const SnappingDistanceIntervalProvider({
    required this.targetDistance,
    this.steps = SnappingIntervalHelper.defaultSteps,
  });

  final double targetDistance;
  final List<double> steps;

  @override
  IntervalData getIntervalData({
    required Range range,
    required double length,
  }) {
    final IntervalMatch intervalMatch = SnappingIntervalHelper.getNearestIntervalMatch(
      range: range,
      targetCount: length / targetDistance,
    );

    return IntervalData(
      intervals: intervalMatch.intervals,
      range: Range(
        start: intervalMatch.start,
        end: intervalMatch.end,
      ),
    );
  }
}
