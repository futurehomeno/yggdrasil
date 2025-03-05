import 'package:yggdrasil/src/components/yg_graph/interfaces/yg_graph_point.dart';

abstract class YgGraphLabelTextProvider<T extends YgGraphPoint> {
  String getLabelText(T point);
}
