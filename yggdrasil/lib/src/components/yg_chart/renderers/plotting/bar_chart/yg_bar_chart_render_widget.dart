import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/yg_chart_plotting_renderer.dart';

import 'models/bar_chart_data.dart';

class YgBarChartRenderWidget extends LeafRenderObjectWidget {
  const YgBarChartRenderWidget({
    super.key,
    required this.controller,
  });

  final YgChartDatasetController<BarChartData> controller;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgBarChartRenderer(
      controller: controller,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgBarChartRenderer renderObject) {
    renderObject.controller = controller;
  }
}

class YgBarChartRenderer extends YgChartPlottingRenderer<BarChartData> {
  YgBarChartRenderer({
    required super.controller,
  });
}
