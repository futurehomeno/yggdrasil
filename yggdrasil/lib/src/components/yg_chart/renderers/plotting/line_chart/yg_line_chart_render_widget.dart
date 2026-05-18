import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/line_chart/line_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/yg_chart_plotting_renderer.dart';

class YgLineChartRenderWidget extends LeafRenderObjectWidget {
  const YgLineChartRenderWidget({
    super.key,
    required this.controller,
  });

  final YgChartDatasetController<LineChartData> controller;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgLineChartRenderer(
      controller: controller,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgLineChartRenderer renderObject) {
    renderObject.controller = controller;
  }
}

class YgLineChartRenderer extends YgChartPlottingRenderer<LineChartData> {
  YgLineChartRenderer({
    required super.controller,
  });
}
