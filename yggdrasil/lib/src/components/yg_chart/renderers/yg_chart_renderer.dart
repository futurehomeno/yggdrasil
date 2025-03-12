import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/background_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/vertical_axis_renderer.dart';

import 'horizontal_axis_renderer.dart';

class YgChartRendererParentData extends ContainerBoxParentData<RenderBox> {
  DataSet<num, DataPoint<num>>? dataSet;
}

class YgChartRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgChartRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgChartRendererParentData> {
  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgChartRendererParentData();
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
    required this.bottomAxis,
    required this.leftAxis,
    required this.plottingRenderers,
    required this.rightAxis,
  });

  final List<PlottingRenderer> plottingRenderers;
  final VerticalAxisRenderer? leftAxis;
  final VerticalAxisRenderer? rightAxis;
  final HorizontalAxisRenderer? bottomAxis;
  final BackgroundRenderer? backgroundRenderer;
}
