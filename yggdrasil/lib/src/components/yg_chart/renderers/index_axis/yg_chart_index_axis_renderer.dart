import 'package:yggdrasil/src/components/yg_chart/models/insets/horizontal_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/yg_chart_renderer.dart';

abstract class YgChartIndexAxisRenderer extends ChartChildRenderer<YgChartIndexAxisRendererParentData> {
  HorizontalEdgeInsets getMinHorizontalPadding() => HorizontalEdgeInsets.zero;
}

class YgChartIndexAxisRendererParentData extends YgChartParentData {
  DoubleRange? indexRange;
  HorizontalEdgeInsets? horizontalPadding;
}
