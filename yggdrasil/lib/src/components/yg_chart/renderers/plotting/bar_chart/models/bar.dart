import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';

class Bar {
  const Bar({
    required this.value,
    required this.variant,
  });

  final double value;
  final DataVariant variant;
}
