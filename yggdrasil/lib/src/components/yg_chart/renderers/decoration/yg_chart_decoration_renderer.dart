import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/yg_chart_renderer.dart';

class YgChartDecorationRenderer extends ChartChildRenderer<YgChartDecorationRendererParentData> {
  @override
  YgChartDecorationRendererParentData createParentData() {
    return YgChartDecorationRendererParentData();
  }
}

class YgChartDecorationRendererParentData extends YgChartParentData {
  EdgeInsets? padding;
}
