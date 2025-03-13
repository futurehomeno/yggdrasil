import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/decoration/yg_chart_decoration_renderer.dart';
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
  Dataset<num, DataPoint<num>>? dataSet;
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
    final List<YgChartPlottingRenderer<AnyDataset>> plottingRenderers = <YgChartPlottingRenderer<AnyDataset>>[];
    final List<YgChartDecorationRenderer> decorationRenderers = <YgChartDecorationRenderer>[];
    YgChartValueAxisRenderer? primaryAxis;
    YgChartValueAxisRenderer? secondaryAxis;
    YgChartIndexAxisRenderer? indexAxis;

    for (RenderBox? child = firstChild; child != null; child = childAfter(child)) {
      switch (child) {
        // ignore: always_specify_types
        case YgChartPlottingRenderer():
          plottingRenderers.add(child);
          break;

        case YgChartDecorationRenderer():
          decorationRenderers.add(child);
          break;

        case YgChartValueAxisRenderer() when child.group == DataGroup.primary:
          assert(
            primaryAxis == null,
            'Can not have more than one primaryAxis',
          );

          primaryAxis ??= child;
          break;

        case YgChartValueAxisRenderer() when child.group == DataGroup.secondary:
          assert(
            secondaryAxis == null,
            'Can not have more than one secondaryAxis',
          );

          secondaryAxis ??= child;
          break;

        case YgChartIndexAxisRenderer():
          assert(
            indexAxis == null,
            'Can not have more than one indexAxis',
          );

          indexAxis ??= child;
          break;
      }
    }

    return _Children(
      decorationRenderers: decorationRenderers,
      indexAxis: indexAxis,
      primaryAxis: primaryAxis,
      plottingRenderers: plottingRenderers,
      secondaryAxis: secondaryAxis,
    );
  }
}

class _Children {
  const _Children({
    required this.decorationRenderers,
    required this.indexAxis,
    required this.primaryAxis,
    required this.plottingRenderers,
    required this.secondaryAxis,
  });

  final List<YgChartPlottingRenderer<AnyDataset>> plottingRenderers;
  final List<YgChartDecorationRenderer>? decorationRenderers;
  final YgChartValueAxisRenderer? primaryAxis;
  final YgChartValueAxisRenderer? secondaryAxis;
  final YgChartIndexAxisRenderer? indexAxis;
}
