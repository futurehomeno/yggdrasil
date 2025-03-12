import 'package:yggdrasil/src/components/yg_chart/models/insets/horizontal_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_widget.dart';

abstract class HorizontalAxisPainter extends ChartPainter {
  HorizontalEdgeInsets getMinimumInsets() => HorizontalEdgeInsets.zero;
}
