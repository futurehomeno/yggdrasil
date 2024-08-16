import 'package:yggdrasil/src/components/yg_graph/interfaces/_interfaces.dart';
import 'package:yggdrasil/src/components/yg_graph/renderers/field_renderers/yg_bar_graph/models/yg_bar_style.dart';

abstract interface class YgBarStyleProvider<T extends YgGraphPoint> {
  const YgBarStyleProvider();

  YgBarStyle getBarStyleForData(T data);
}
