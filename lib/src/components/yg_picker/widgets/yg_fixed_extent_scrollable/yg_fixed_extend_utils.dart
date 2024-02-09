import 'dart:math' as math;

/// Utilities for the [YgFixedExtendScrollable] and related classes.
class YgFixedExtendUtils {
  const YgFixedExtendUtils._();

  static int getItemFromOffset({
    required double offset,
    required double itemExtent,
    required double minScrollExtent,
    required double maxScrollExtent,
  }) {
    return (clipOffsetToScrollableRange(offset, minScrollExtent, maxScrollExtent) / itemExtent).round();
  }

  static double clipOffsetToScrollableRange(
    double offset,
    double minScrollExtent,
    double maxScrollExtent,
  ) {
    return math.min(math.max(offset, minScrollExtent), maxScrollExtent);
  }
}
