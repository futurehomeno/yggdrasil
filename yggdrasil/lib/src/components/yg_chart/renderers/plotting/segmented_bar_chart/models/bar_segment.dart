import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';

class BarSegment {
  const BarSegment({
    required this.value,
    required this.variant,
  });

  /// The value of the segment.
  ///
  /// This adds up with other segments to create the total value of a bar.
  final double value;

  /// The variant of the bar.
  ///
  /// Used to determine the color
  final DataVariant variant;
}
