import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/yg_chart_renderer.dart';

abstract class YgChartPlottingRenderer extends ChartChildRenderer<YgChartPlottingRendererParentData> {}

class YgChartPlottingRendererParentData extends YgChartParentData {}
