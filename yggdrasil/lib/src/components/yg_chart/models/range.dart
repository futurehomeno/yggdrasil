import 'dart:math' as math;

typedef DoubleRange = Range<double>;
typedef IntRange = Range<int>;

// TODO: Maybe add support to methods for figuring out the best return type automatically?
class Range<N extends num> {
  const Range({
    required this.end,
    required this.start,
  });

  const Range.point(N point)
      : start = point,
        end = point;

  final N start;
  final N end;

  /// Returns a new range which includes both this and the [other] range.
  DoubleRange encapsulate(Range<num> other) {
    return DoubleRange(
      start: math.min(start.toDouble(), other.start.toDouble()),
      end: math.max(end.toDouble(), other.end.toDouble()),
    );
  }

  /// Returns a new range which falls within both this and the [other] range.
  DoubleRange? intersect(DoubleRange other) {
    final double newStart = math.max(start.toDouble(), other.start.toDouble());
    final double newEnd = math.min(end.toDouble(), other.end.toDouble());

    if (newStart > newEnd) {
      return null;
    }

    return DoubleRange(
      start: newStart,
      end: newEnd,
    );
  }

  /// Takes an [List] and returns a [Iterable] which iterates over the index
  /// which falls within this range.
  Iterable<T> clampList<T>(List<T> iterable) {
    return iterable.skip(start.ceil()).take(length.floor());
  }

  DoubleRange lerp(Range<num> other, double t) {
    return DoubleRange(
      start: start.toDouble() + (other.start.toDouble() - start.toDouble()) * t,
      end: end.toDouble() + (other.end.toDouble() - end.toDouble()) * t,
    );
  }

  IntRange toIntRange() {
    final Range<num> that = this;
    if (that is IntRange) {
      return that;
    }

    return IntRange(
      start: start.round(),
      end: end.round(),
    );
  }

  DoubleRange toDoubleRange() {
    final Range<num> that = this;
    if (that is DoubleRange) {
      return that;
    }

    return DoubleRange(
      start: start.toDouble(),
      end: end.toDouble(),
    );
  }

  /// The highest value out of start and end.
  N get max => math.max(start, end);

  /// The lowest value out of start and end.
  N get min => math.min(start, end);

  N get length => (end - start) as N;

  @override
  String toString() => 'Range($start, $end)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Range && other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}
