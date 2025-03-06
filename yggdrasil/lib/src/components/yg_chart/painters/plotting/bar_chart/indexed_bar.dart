import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data_point.dart';

class IndexedBar extends DataPoint<int> {
  const IndexedBar({
    required super.index,
    required super.value,
    required this.variant,
  });

  final DataVariant variant;
}
