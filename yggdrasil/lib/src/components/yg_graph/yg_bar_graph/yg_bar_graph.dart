import 'package:yggdrasil/src/components/yg_graph/interfaces/_interfaces.dart';
import 'package:yggdrasil/src/components/yg_graph/yg_bar_graph/interfaces/yg_bar_style_provider.dart';

class YgBarGraph<T extends YgGraphData> {
  const YgBarGraph({
    required this.dataProvider,
    required this.styleProvider,
  });

  final YgGraphDataProvider<T> dataProvider;
  final YgBarStyleProvider<T> styleProvider;
}
