import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/yg_chart_renderer.dart';

abstract class YgChartValueAxisRenderer extends ChartChildRenderer<YgChartValueAxisRendererParentData> {
  YgChartValueAxisRenderer({
    required this.group,
  });

  final DataGroup group;
}

class YgChartValueAxisRendererParentData extends YgChartParentData {}
