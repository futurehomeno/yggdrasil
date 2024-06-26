import 'package:yggdrasil/src/components/yg_graph/interfaces/_interfaces.dart';
import 'package:yggdrasil/src/components/yg_graph/yg_bar_graph/models/yg_bar_style.dart';

abstract interface class YgBarStyleProvider<T extends YgGraphData> {
  const YgBarStyleProvider();

  YgBarStyle getBarStyleForData(T data);
}
