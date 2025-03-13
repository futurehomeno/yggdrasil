import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval_data.dart';
import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/yg_interval_provider.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_axes_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';
import 'package:yggdrasil/src/components/yg_chart/models/insets/vertical_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/decoration/yg_chart_decoration_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/index_axis/yg_chart_index_axis_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/value_axis/yg_chart_value_axis_renderer.dart';

import 'plotting/yg_chart_plotting_renderer.dart';

class YgChartRenderWidget extends MultiChildRenderObjectWidget {
  const YgChartRenderWidget({
    super.key,
    super.children,
    required this.controller,
    required this.axisConfig,
  });

  final YgChartController controller;
  final YgAxesConfig axisConfig;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgChartRenderer(
      controller: controller,
      axisConfig: axisConfig,
    );
  }

  @override
  void updateRenderObject(BuildContext context, YgChartRenderer renderObject) {
    renderObject.controller = controller;
    renderObject.axisConfig = axisConfig;
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
    required YgAxesConfig axisConfig,
  })  : _controller = controller,
        _axisConfig = axisConfig;

  // region Values

  YgChartController _controller;
  YgChartController get controller => _controller;
  set controller(YgChartController controller) {
    if (_controller != controller) {
      _controller.indexRange.removeListener(_updateIndexRange);
      _controller.primaryValueRange.removeListener(_updatePrimaryRange);
      _controller.secondaryValueRange.removeListener(_updateSecondaryRange);
      _controller = controller;
      _controller.indexRange.addListener(_updateIndexRange);
      _controller.primaryValueRange.addListener(_updatePrimaryRange);
      _controller.secondaryValueRange.addListener(_updateSecondaryRange);
      markNeedsLayout();
    }
  }

  YgAxesConfig _axisConfig;
  YgAxesConfig get axisConfig => _axisConfig;
  set axisConfig(YgAxesConfig axisConfig) {
    if (_axisConfig != axisConfig) {
      _axisConfig = axisConfig;
      // TODO: Probably not layout.
      markNeedsLayout();
    }
  }

  // endregion

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _controller.indexRange.addListener(_updateIndexRange);
    _controller.primaryValueRange.addListener(_updatePrimaryRange);
    _controller.secondaryValueRange.addListener(_updateSecondaryRange);
  }

  @override
  void detach() {
    _controller.indexRange.removeListener(_updateIndexRange);
    _controller.primaryValueRange.removeListener(_updatePrimaryRange);
    _controller.secondaryValueRange.removeListener(_updateSecondaryRange);
    super.detach();
  }

  @override
  void dispose() {
    _controller.indexRange.removeListener(_updateIndexRange);
    _controller.primaryValueRange.removeListener(_updatePrimaryRange);
    _controller.secondaryValueRange.removeListener(_updateSecondaryRange);
    super.dispose();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgChartParentData();
  }

  @override
  void performLayout() {
    final _Children children = _getChildren();

    final VerticalEdgeInsets verticalPadding = _getVerticalPadding(children);
    final IntervalData intervalData = axisConfig.primary.interval.getIntervalData(dataRange: dataRange, space: space);

    final EdgeInsets plotterPadding = _getMinPadding(children);
  }

  VerticalEdgeInsets _getVerticalPadding(_Children children) {
    final _Children(
      :YgChartValueAxisRenderer? primaryAxis,
      :YgChartValueAxisRenderer? secondaryAxis,
    ) = children;

    double top = 0;
    double bottom = 0;

    void handle(YgChartValueAxisRenderer axis) {
      final VerticalEdgeInsets padding = axis.getMinVerticalPadding();
      if (padding.bottom > bottom) {
        bottom = padding.bottom;
      }
      if (padding.top > top) {
        top = padding.top;
      }
    }

    if (primaryAxis != null) {
      handle(primaryAxis);
    }

    if (secondaryAxis != null) {
      handle(secondaryAxis);
    }

    return VerticalEdgeInsets.only(
      bottom: bottom,
      top: top,
    );
  }

  EdgeInsets _getMinPadding(_Children children) {
    double top = 0;
    double bottom = 0;
    double left = 0;
    double right = 0;
    for (final YgChartPlottingRenderer<AnyDataset> plotter in children.plotters) {
      final EdgeInsets padding = plotter.getMinPadding();
      if (padding.top > top) {
        top = padding.top;
      }
      if (padding.bottom > bottom) {
        bottom = padding.bottom;
      }
      if (padding.left > left) {
        left = padding.left;
      }
      if (padding.right > right) {
        right = padding.right;
      }
    }

    return EdgeInsets.fromLTRB(
      left,
      top,
      right,
      bottom,
    );
  }

  void _updateIndexRange() {
    final DoubleRange indexRange = _controller.indexRange.value;
    final _Children(
      :List<YgChartPlottingRenderer<AnyDataset>> plotters,
      :YgChartIndexAxisRenderer? indexAxis,
    ) = _getChildren();

    for (final YgChartPlottingRenderer<AnyDataset> plotter in plotters) {
      plotter.parentData.indexRange = indexRange;
      plotter.markNeedsPaint();
    }

    if (indexAxis != null) {
      indexAxis.parentData.indexRange = indexRange;
      indexAxis.markNeedsPaint();
    }
  }

  void _updatePrimaryRange() {
    final DoubleRange primaryRange = _controller.primaryValueRange.value;
    final _Children(
      :List<YgChartPlottingRenderer<AnyDataset>> plotters,
      :YgChartValueAxisRenderer? primaryAxis,
    ) = _getChildren();

    for (final YgChartPlottingRenderer<AnyDataset> plotter in plotters) {
      plotter.parentData.valueRange = primaryRange;
      plotter.markNeedsPaint();
    }

    if (primaryAxis != null) {
      primaryAxis.parentData.valueRange = primaryRange;
      primaryAxis.markNeedsPaint();
    }
  }

  void _updateSecondaryRange() {
    final DoubleRange secondaryRange = _controller.secondaryValueRange.value;
    final _Children(
      :List<YgChartPlottingRenderer<AnyDataset>> plotters,
      :YgChartValueAxisRenderer? secondaryAxis,
    ) = _getChildren();

    for (final YgChartPlottingRenderer<AnyDataset> plotter in plotters) {
      plotter.parentData.valueRange = secondaryRange;
      plotter.markNeedsPaint();
    }

    if (secondaryAxis != null) {
      secondaryAxis.parentData.valueRange = secondaryRange;
      secondaryAxis.markNeedsPaint();
    }
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
      plotters: plottingRenderers,
      secondaryAxis: secondaryAxis,
    );
  }
}

class _Children {
  const _Children({
    required this.decorationRenderers,
    required this.indexAxis,
    required this.primaryAxis,
    required this.plotters,
    required this.secondaryAxis,
  });

  final List<YgChartPlottingRenderer<AnyDataset>> plotters;
  final List<YgChartDecorationRenderer>? decorationRenderers;
  final YgChartValueAxisRenderer? primaryAxis;
  final YgChartValueAxisRenderer? secondaryAxis;
  final YgChartIndexAxisRenderer? indexAxis;
}

// class YgAxesConfig {
//   const YgAxesConfig({
//     required this.indexIntervalProvider,
//     required this.primaryIntervalProvider,
//     required this.secondaryIntervalProvider,
//   });

//   final YgIntervalProvider primaryIntervalProvider;
//   final YgIntervalProvider secondaryIntervalProvider;
//   final YgIntervalProvider indexIntervalProvider;

//   @override
//   bool operator ==(Object other) =>
//       other is YgAxesConfig &&
//       other.indexIntervalProvider == indexIntervalProvider &&
//       other.primaryIntervalProvider == primaryIntervalProvider &&
//       other.secondaryIntervalProvider == secondaryIntervalProvider;

//   @override
//   int get hashCode => Object.hash(
//         indexIntervalProvider,
//         primaryIntervalProvider,
//         secondaryIntervalProvider,
//       );
// }
