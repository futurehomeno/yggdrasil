import 'dart:math' as math;

typedef DoubleRange = Range<double>;
typedef IntRange = Range<int>;
typedef AnyRange = Range<num>;

// TODO: Maybe add support to methods for figuring out the best return type automatically?
class Range<N extends num> {
  const Range({
    required this.end,
    required this.start,
  });

  const Range.point(N point)
      : start = point,
        end = point;

  static const DoubleRange doubleZero = DoubleRange(start: 0, end: 0);
  static const IntRange intZero = IntRange(start: 0, end: 0);
  static const DoubleRange infinite = DoubleRange(start: double.negativeInfinity, end: double.infinity);

  static Range<N>? lerp<N extends num>(Range<N>? from, Range<N>? to, double t) {
    if (from == null && to == null) {
      return null;
    }

    if (from == null) {
      return _asType(
        DoubleRange(
          end: to!.end * t,
          start: to.start * t,
        ),
      );
    }

    if (to == null) {
      return _asType(
        DoubleRange(
          end: from.end * (1 - t),
          start: from.start * (1 - t),
        ),
      );
    }

    return _asType(
      DoubleRange(
        end: (to.end - from.end) * t + from.end,
        start: (to.start - from.start) * t + from.start,
      ),
    );
  }

  static Range<N>? merge<N extends num>(List<Range<N>> ranges) {
    if (ranges.isEmpty) {
      return null;
    }

    if (ranges.length == 1) {
      return ranges.first;
    }

    N min = ranges.first.min;
    N max = ranges.first.max;
    for (int i = 1; i < ranges.length; i++) {
      final Range<N> range = ranges[i];
      if (range.min > min) {
        min = range.min;
      }
      if (range.max > max) {
        max = range.max;
      }
    }

    return Range<N>(
      start: min,
      end: max,
    );
  }

  static Range<N> _asType<N extends num>(Range<num> range) {
    if (N == double) {
      return range.toDoubleRange() as Range<N>;
    }

    return range.toIntRange() as Range<N>;
  }

  final N start;
  final N end;

  Range<N> encapsulatePoint(N point) {
    return Range<N>(
      start: math.min(min, point),
      end: math.max(max, point),
    );
  }

  /// Returns a new range which includes both this and the [other] range.
  Range<N> encapsulate(Range<N> other) {
    return Range<N>(
      start: math.min(min, other.min),
      end: math.max(max, other.max),
    );
  }

  /// Whether this range fully contains the [other] range.
  bool contains(Range<N> other) {
    return other.min >= min && other.max <= max;
  }

  bool containsPoint(double point) {
    return point >= min && point <= max;
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

  Range<N> lerpTo(Range<N> other, double t) => lerp(this, other, t)!;

  Range<N> lerpFrom(Range<N> other, double t) => lerp(other, this, t)!;

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

  Range<N> withLength(
    N length, {
    double alignment = 0.5,
  }) {
    if (length == this.length) {
      return this;
    }

    final num difference = length - this.length;

    if (N == double) {
      final double newStart = min - difference * alignment;

      return DoubleRange(
        start: newStart,
        end: newStart + length,
      ) as Range<N>;
    }

    final int newStart = (min - difference * alignment).round();

    return IntRange(
      start: newStart,
      end: newStart + length as int,
    ) as Range<N>;
  }

  Range<N> get normalized => isNormalized ? this : Range<N>(start: min, end: max);

  /// The highest value out of start and end.
  N get max => math.max(start, end);

  /// The lowest value out of start and end.
  N get min => math.min(start, end);

  N get length => (end - start).abs() as N;

  bool get isFinite => start.isFinite && end.isFinite;

  bool get isInfinite => start.isInfinite || end.isInfinite;

  bool get isNormalized => start >= end;

  /// Whether a range has a length of more than 0.
  bool get isNotEmpty => start != end;

  bool get isEmpty => start == end;

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
