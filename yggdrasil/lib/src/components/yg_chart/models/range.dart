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

  static const DoubleRange doubleZero = DoubleRange(start: 0, end: 0);
  static const IntRange intZero = IntRange(start: 0, end: 0);

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

  static Range<N> _asType<N extends num>(Range<num> range) {
    if (N == double) {
      return range.toDoubleRange() as Range<N>;
    }

    return range.toIntRange() as Range<N>;
  }

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
