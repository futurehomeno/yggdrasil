import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';

class BarSegment {
  const BarSegment({
    required this.value,
    required this.variant,
  });

  final double value;
  final DataVariant variant;
}
