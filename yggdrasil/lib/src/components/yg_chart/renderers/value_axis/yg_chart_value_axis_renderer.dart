import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/models/insets/vertical_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/yg_chart_renderer.dart';

abstract class YgChartValueAxisRenderer extends ChartChildRenderer<YgChartValueAxisRendererParentData> {
  YgChartValueAxisRenderer({
    required DataGroup group,
  }) : _group = group;

  DataGroup _group;
  DataGroup get group => _group;
  set group(DataGroup group) {
    if (group == _group) {
      return;
    }

    _group = group;
    parent?.markNeedsLayout();
  }

  VerticalEdgeInsets getMinVerticalPadding() => VerticalEdgeInsets.zero;
}

class YgChartValueAxisRendererParentData extends YgChartParentData {
  DoubleRange? valueRange;
}
