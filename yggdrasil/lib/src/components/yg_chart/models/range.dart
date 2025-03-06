import 'dart:math';

typedef DoubleRange = Range<double>;
typedef IntRange = Range<int>;

class Range<N extends num> {
  const Range({
    required this.end,
    required this.start,
  });

  final N start;
  final N end;

  /// Returns a new range which includes both this and the [other] range.
  DoubleRange encapsulate(Range<num> other) {
    return DoubleRange(
      start: min(start.toDouble(), other.start.toDouble()),
      end: max(end.toDouble(), other.end.toDouble()),
    );
  }

  /// Returns a new range which falls within both this and the [other] range.
  DoubleRange? intersect(DoubleRange other) {
    final double newStart = max(start.toDouble(), other.start.toDouble());
    final double newEnd = min(end.toDouble(), other.end.toDouble());

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
