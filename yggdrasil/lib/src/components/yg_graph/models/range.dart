import 'dart:math';

/// A value range.
class Range {
  const Range({
    required this.start,
    required this.end,
  }) : assert(
          end >= start,
          'The end of a range must be equal to or higher than the start of a range.',
        );

  static const Range zero = Range(end: 0, start: 0);

  final double start;
  final double end;

  /// Returns a new range which includes both this and the [other] range.
  Range encapsulate(Range other) {
    return Range(
      start: min(start, other.start),
      end: max(end, other.end),
    );
  }

  /// Returns a new range which falls within both this and the [other] range.
  Range? intersect(Range other) {
    final double newStart = max(start, other.start);
    final double newEnd = min(end, other.end);

    if (newStart > newEnd) {
      return null;
    }

    return Range(
      start: newStart,
      end: newEnd,
    );
  }

  /// Takes an [List] and returns a [Iterable] which iterates over the index
  /// which falls within this range.
  Iterable<T> clampList<T>(List<T> iterable) {
    return iterable.skip(start.ceil()).take(length.floor());
  }

  double get length => end - start;

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
