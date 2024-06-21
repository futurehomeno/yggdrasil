import 'package:yggdrasil/src/components/yg_mini_bar_graph/enums/_enums.dart';

class YgBarGraphBar {
  const YgBarGraphBar({
    required this.variant,
    required this.value,
  });

  final BarVariant variant;
  final double value;
}
