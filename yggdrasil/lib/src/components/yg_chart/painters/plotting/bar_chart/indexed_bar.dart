import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_point.dart';

class IndexedBar extends DataPoint<int> {
  IndexedBar({
    required super.index,
    required super.value,
    required this.variant,
  });

  final DataVariant variant;
}
