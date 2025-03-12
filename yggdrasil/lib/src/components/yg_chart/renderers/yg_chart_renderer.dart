import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/background_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/index_axis/yg_chart_index_axis_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/value_axis/yg_chart_value_axis_renderer.dart';

import 'plotting/yg_chart_plotting_renderer.dart';

class YgChartRenderWidget extends MultiChildRenderObjectWidget {
  const YgChartRenderWidget({
    super.key,
    super.children,
    required this.controller,
  });

  final YgChartController controller;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgChartRenderer(
      controller: controller,
    );
  }

  @override
  void updateRenderObject(BuildContext context, YgChartRenderer renderObject) {
    renderObject.controller = controller;
  }
}

class YgChartParentData extends ContainerBoxParentData<RenderBox> {
  DataSet<num, DataPoint<num>>? dataSet;
}

class YgChartRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgChartParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgChartParentData> {
  YgChartRenderer({
    required YgChartController controller,
  }) : _controller = controller;

  // region Values

  YgChartController _controller;
  YgChartController get controller => _controller;
  set controller(YgChartController controller) {
    if (_controller != controller) {
      _controller = controller;
      markNeedsLayout();
    }
  }

  // endregion

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgChartParentData();
  }

  @override
  void performLayout() {
    final _Children children = _getChildren();
  }

  _Children _getChildren() {
    throw UnimplementedError();
  }
}

class _Children {
  const _Children({
    required this.backgroundRenderer,
    required this.indexAxis,
    required this.primaryAxis,
    required this.plottingRenderers,
    required this.secondaryAxis,
  });

  final List<YgChartPlottingRenderer> plottingRenderers;
  final YgChartValueAxisRenderer? primaryAxis;
  final YgChartValueAxisRenderer? secondaryAxis;
  final YgChartIndexAxisRenderer? indexAxis;
  final BackgroundRenderer? backgroundRenderer;
}
