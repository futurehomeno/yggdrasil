import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';

class SnappingIntervalHelper {
  const SnappingIntervalHelper._();

  static const List<double> defaultSteps = <double>[1, 2, 3, 5];

  static IntervalMatch getNearestIntervalMatch({
    required Range range,
    required num targetCount,
    List<double> steps = defaultSteps,
  }) {
    IntervalMatch? nearestMatch;

    for (double magnitude = 1e-15; magnitude < 1e15; magnitude *= 10) {
      for (final double step in steps) {
        // Calculate the interval size based on the current step and magnitude
        final double intervalSize = step * (magnitude / 1000);
        // Calculate the start of the interval, rounded down to the nearest interval size
        final double start = (range.start / intervalSize).floor() * intervalSize;
        // Calculate the end of the interval, rounded up to the nearest interval size
        final double end = (range.end / intervalSize).ceil() * intervalSize;
        // Calculate the number of intervals between start and end
        final int intervals = ((end - start) ~/ intervalSize) + 1;

        final double difference = (intervals - targetCount.toDouble()).abs();

        if (nearestMatch == null || nearestMatch.distance >= intervals) {
          nearestMatch = IntervalMatch(
            distance: difference,
            intervals: intervals,
            intervalSize: intervalSize,
            end: end,
            start: start,
          );
        } else {
          return nearestMatch;
        }
      }
    }

    // Can never be null at this point. Should not even reach this point unless
    // some really dumb data is passed, like a range of values from 0 to
    // 1000000000000000, who even makes graphs like that.
    return nearestMatch!;
  }
}

class IntervalMatch {
  const IntervalMatch({
    required this.distance,
    required this.intervals,
    required this.intervalSize,
    required this.end,
    required this.start,
  });

  final int intervals;
  final double distance;
  final double intervalSize;
  final double start;
  final double end;
}
