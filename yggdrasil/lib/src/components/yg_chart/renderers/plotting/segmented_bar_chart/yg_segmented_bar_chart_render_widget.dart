import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/segmented_bar_chart/models/segmented_bar_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/yg_chart_plotting_renderer.dart';

class YgSegmentedBarChartRenderWidget extends LeafRenderObjectWidget {
  const YgSegmentedBarChartRenderWidget({
    super.key,
    required this.controller,
  });

  final YgChartDatasetController<SegmentedBarChartData> controller;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSegmentedBarChartRenderer(
      controller: controller,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSegmentedBarChartRenderer renderObject) {
    renderObject.controller = controller;
  }
}

class YgSegmentedBarChartRenderer extends YgChartPlottingRenderer<SegmentedBarChartData> {
  YgSegmentedBarChartRenderer({
    required super.controller,
  });
}
