import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_axis_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';
import 'package:yggdrasil/src/components/yg_chart/models/insets/horizontal_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/insets/vertical_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/decoration/yg_chart_decoration_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/index_axis/yg_chart_index_axis_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/value_axis/yg_chart_value_axis_renderer.dart';

import 'plotting/yg_chart_plotting_renderer.dart';

class YgChartRenderWidget extends MultiChildRenderObjectWidget {
  const YgChartRenderWidget({
    super.key,
    super.children,
    required this.controller,
    required this.height,
    required this.width,
    required this.link,
    required this.axisConfig,
  });

  final YgChartController controller;
  final double? width;
  final double? height;
  final LayerLink link;
  final YgAxisConfig axisConfig;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgChartRenderer(
      controller: controller,
      height: height,
      width: width,
      link: link,
      axisConfig: axisConfig,
    );
  }

  @override
  void updateRenderObject(BuildContext context, YgChartRenderer renderObject) {
    renderObject.controller = controller;
    renderObject.height = height;
    renderObject.width = width;
    renderObject.link = link;
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
    required double? width,
    required double? height,
    required LayerLink link,
    required YgAxisConfig axisConfig,
  })  : _controller = controller,
        _width = width,
        _height = height,
        _link = link,
        _axisConfig = axisConfig;

  LeaderLayer? _leaderLayer;

  // region Values

  LayerLink _link;
  LayerLink get link => _link;
  set link(LayerLink link) {
    if (_link != link) {
      _link = link;
      _leaderLayer?.link = link;
    }
  }

  YgAxisConfig _axisConfig;
  YgAxisConfig get axisConfig => _axisConfig;
  set axisConfig(YgAxisConfig axisConfig) {
    if (_axisConfig != axisConfig) {
      _axisConfig = axisConfig;
      markNeedsLayout();
    }
  }

  double? _width;
  double? get width => _width;
  set width(double? width) {
    if (_width != width) {
      _width = width;
      markNeedsLayout();
    }
  }

  double? _height;
  double? get height => _height;
  set height(double? height) {
    if (_height != height) {
      _height = height;
      markNeedsLayout();
    }
  }

  YgChartController _controller;
  YgChartController get controller => _controller;
  set controller(YgChartController controller) {
    if (_controller != controller) {
      _controller.removeListener(markNeedsLayout);
      _controller = controller;
      _controller.addListener(markNeedsLayout);
      markNeedsLayout();
    }
  }

  // endregion

  // region Lifecycle

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _controller.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _controller.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void dispose() {
    _controller.removeListener(markNeedsLayout);
    super.dispose();
  }

  // endregion

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgChartParentData();
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    final double preferredWidth = constraints.constrainWidth(
      _width ?? constraints.maxWidth,
    );
    final double preferredHeight = constraints.constrainHeight(
      _height ?? constraints.maxHeight,
    );

    if (preferredHeight.isFinite && preferredWidth.isFinite) {
      return Size(
        preferredWidth,
        preferredHeight,
      );
    }

    final _Children(
      :List<YgChartPlottingRenderer<AnyDataset>> plotters,
      :YgChartIndexAxisRenderer? indexAxis,
      :YgChartValueAxisRenderer? primaryAxis,
      :YgChartValueAxisRenderer? secondaryAxis,
    ) = _getChildren();

    double plottingTopPadding = 0;
    double plottingBottomPadding = 0;
    double plottingLeftPadding = 0;
    double plottingRightPadding = 0;
    for (final YgChartPlottingRenderer<AnyDataset> plotter in plotters) {
      final EdgeInsets minPadding = plotter.getMinPadding();
      plottingTopPadding = max(minPadding.top, plottingTopPadding);
      plottingBottomPadding = max(minPadding.bottom, plottingBottomPadding);
      plottingLeftPadding = max(minPadding.left, plottingLeftPadding);
      plottingRightPadding = max(minPadding.right, plottingRightPadding);
    }

    double bottomAxisPadding = 0;
    double topPadding = plottingTopPadding;

    if (primaryAxis != null) {
      final VerticalEdgeInsets padding = primaryAxis.getMinVerticalPadding();
      topPadding = max(padding.top, topPadding);
      bottomAxisPadding = max(padding.bottom, bottomAxisPadding);
    }

    if (secondaryAxis != null) {
      final VerticalEdgeInsets padding = secondaryAxis.getMinVerticalPadding();
      topPadding = max(padding.top, topPadding);
      bottomAxisPadding = max(padding.bottom, bottomAxisPadding);
    }

    final double indexAxisHeight = indexAxis?.getMinIntrinsicHeight(preferredWidth) ?? 0;
    final double bottomPadding = max(
      indexAxisHeight + plottingBottomPadding,
      bottomAxisPadding,
    );

    final double height;
    double plottingHeight = 0;
    if (preferredHeight.isFinite) {
      height = preferredHeight;
      plottingHeight = max(0, height - topPadding - bottomPadding);
    } else {
      for (final YgChartPlottingRenderer<AnyDataset> plotter in plotters) {
        plottingHeight = max(
          plottingHeight,
          plotter.getMinIntrinsicHeight(preferredWidth),
        );
      }

      height = plottingHeight + topPadding + bottomPadding;
    }

    double width;
    if (preferredWidth.isFinite) {
      width = preferredWidth;
    } else {
      width = 0;
      for (final YgChartPlottingRenderer<AnyDataset> plotter in plotters) {
        width = max(
          width,
          plotter.getMinIntrinsicWidth(plottingHeight),
        );
      }
      width += plottingLeftPadding + plottingRightPadding;

      if (primaryAxis != null) {
        width += primaryAxis.getMinIntrinsicWidth(height);
      }

      if (secondaryAxis != null) {
        width += secondaryAxis.getMinIntrinsicWidth(height);
      }

      if (indexAxis != null) {
        width += indexAxis.getMinHorizontalPadding().horizontal;
      }
    }

    return Size(
      width,
      height,
    );
  }

  @override
  void performResize() {
    size = computeDryLayout(constraints);
  }

  @override
  void performLayout() {
    final Size(
      :double width,
      :double height,
    ) = size;

    if (width == 0 || height == 0) {
      return;
    }

    final _Children(
      :List<YgChartPlottingRenderer<AnyDataset>> plotters,
      :YgChartIndexAxisRenderer? indexAxis,
      :YgChartValueAxisRenderer? primaryAxis,
      :YgChartValueAxisRenderer? secondaryAxis,
      :List<YgChartDecorationRenderer> decorators
    ) = _getChildren();

    // region Plotting padding + index pixel scale

    double minIndexPixelScale = 0;
    double plottingTopPadding = 0;
    double plottingBottomPadding = 0;
    double plottingLeftPadding = 0;
    double plottingRightPadding = 0;
    for (final YgChartPlottingRenderer<AnyDataset> plotter in plotters) {
      final EdgeInsets minPadding = plotter.getMinPadding();
      plottingTopPadding = max(minPadding.top, plottingTopPadding);
      plottingBottomPadding = max(minPadding.bottom, plottingBottomPadding);
      plottingLeftPadding = max(minPadding.left, plottingLeftPadding);
      plottingRightPadding = max(minPadding.right, plottingRightPadding);
      minIndexPixelScale = max(plotter.getMinIndexPixelScale(), minIndexPixelScale);
    }

    if (indexAxis != null) {
      final HorizontalEdgeInsets padding = indexAxis.getMinHorizontalPadding();
      plottingLeftPadding = max(padding.left, plottingLeftPadding);
      plottingRightPadding = max(padding.right, plottingRightPadding);
    }

    final double totalPreferredVerticalPlottingPadding = plottingTopPadding + plottingBottomPadding;
    if (totalPreferredVerticalPlottingPadding > height) {
      final double scale = height / totalPreferredVerticalPlottingPadding;
      plottingTopPadding *= scale;
      plottingBottomPadding *= scale;
    }

    final double totalPreferredHorizontalPlottingPadding = plottingLeftPadding + plottingRightPadding;
    if (totalPreferredHorizontalPlottingPadding > width) {
      final double scale = width / totalPreferredHorizontalPlottingPadding;
      plottingLeftPadding *= scale;
      plottingRightPadding *= scale;
    }

    final double plottingVerticalPadding = plottingTopPadding + plottingBottomPadding;
    final double plottingHorizontalPadding = plottingLeftPadding + plottingRightPadding;

    // endregion

    // region Primary axis dimensions

    final double indexAxisHeight;
    if (indexAxis != null) {
      indexAxisHeight = min(
        indexAxis.getMinIntrinsicHeight(width),
        height - plottingVerticalPadding,
      );
    } else {
      indexAxisHeight = 0;
    }

    // endregion

    // region Vertical axes padding

    final double minVerticalAxisTopPadding = plottingTopPadding;
    final double minVerticalAxisBottomPadding = indexAxisHeight + plottingBottomPadding;
    double verticalAxisTopPadding = minVerticalAxisTopPadding;
    double verticalAxisBottomPadding = minVerticalAxisBottomPadding;
    if (primaryAxis != null) {
      final VerticalEdgeInsets padding = primaryAxis.getMinVerticalPadding();
      verticalAxisTopPadding = max(padding.top, verticalAxisTopPadding);
      verticalAxisBottomPadding = max(padding.bottom, verticalAxisBottomPadding);
    }

    if (secondaryAxis != null) {
      final VerticalEdgeInsets padding = secondaryAxis.getMinVerticalPadding();
      verticalAxisTopPadding = max(padding.top, verticalAxisTopPadding);
      verticalAxisBottomPadding = max(padding.bottom, verticalAxisBottomPadding);
    }

    final double totalAxisVerticalPadding = verticalAxisBottomPadding + verticalAxisTopPadding;
    if (totalAxisVerticalPadding + indexAxisHeight > height) {
      final double availableHeight = height - indexAxisHeight - plottingVerticalPadding;
      final double additionalTopPadding = verticalAxisTopPadding - minVerticalAxisTopPadding;
      final double additionalBottomPadding = verticalAxisBottomPadding - minVerticalAxisBottomPadding;
      final double totalAdditionalPadding = additionalBottomPadding + additionalTopPadding;
      final double scale = availableHeight / totalAdditionalPadding;
      verticalAxisTopPadding = additionalTopPadding * scale;
      verticalAxisBottomPadding = additionalBottomPadding * scale;
    }

    // endregion

    final double plottingBaseHeight = height - verticalAxisBottomPadding - verticalAxisTopPadding - indexAxisHeight;
    controller.updatePlottingHeight(plottingBaseHeight);

    // region Vertical axes dimensions

    final double primaryAxisWidth;
    final double secondaryAxisWidth;
    if (primaryAxis != null || secondaryAxis != null) {
      final double preferredPrimaryAxisWidth;
      if (primaryAxis != null) {
        preferredPrimaryAxisWidth = primaryAxis.getMinIntrinsicWidth(height);
      } else {
        preferredPrimaryAxisWidth = 0;
      }

      final double preferredSecondaryAxisWidth;
      if (secondaryAxis != null) {
        preferredSecondaryAxisWidth = secondaryAxis.getMinIntrinsicWidth(height);
      } else {
        preferredSecondaryAxisWidth = 0;
      }

      final double totalPreferredWidth = preferredSecondaryAxisWidth + preferredPrimaryAxisWidth;
      final double availableWidth = width - plottingHorizontalPadding;
      if (totalPreferredWidth < availableWidth) {
        primaryAxisWidth = preferredPrimaryAxisWidth;
        secondaryAxisWidth = preferredSecondaryAxisWidth;
      } else {
        final double scale = availableWidth / totalPreferredWidth;
        primaryAxisWidth = preferredPrimaryAxisWidth * scale;
        secondaryAxisWidth = preferredSecondaryAxisWidth * scale;
      }
    } else {
      primaryAxisWidth = 0;
      secondaryAxisWidth = 0;
    }

    final double indexAxisWidth = width - primaryAxisWidth - secondaryAxisWidth;

    // endregion

    // region Plotting dimensions

    final double plottingBaseWidth = width - primaryAxisWidth - secondaryAxisWidth - plottingHorizontalPadding;
    controller.updatePlottingWidth(plottingBaseWidth, minIndexPixelScale);

    final double plottingHeight = plottingBaseHeight + plottingVerticalPadding;
    final double plottingWidth = plottingBaseWidth + plottingHorizontalPadding;

    // endregion

    // region Layout

    final VerticalEdgeInsets verticalAxisPadding = VerticalEdgeInsets.only(
      top: verticalAxisTopPadding,
      bottom: verticalAxisBottomPadding,
    );

    if (primaryAxis != null) {
      primaryAxis.parentData.verticalPadding = verticalAxisPadding;
      primaryAxis.layout(BoxConstraints.tightFor(
        width: primaryAxisWidth,
        height: height,
      ));
      primaryAxis.parentData.offset = Offset.zero;
    }

    if (secondaryAxis != null) {
      secondaryAxis.parentData.verticalPadding = verticalAxisPadding;
      secondaryAxis.layout(BoxConstraints.tightFor(
        width: secondaryAxisWidth,
        height: height,
      ));
      secondaryAxis.parentData.offset = Offset(
        width - secondaryAxisWidth,
        0,
      );
    }

    if (indexAxis != null) {
      indexAxis.parentData.horizontalPadding = HorizontalEdgeInsets.only(
        left: plottingLeftPadding,
        right: plottingRightPadding,
      );
      indexAxis.layout(BoxConstraints.tightFor(
        height: indexAxisHeight,
        width: indexAxisWidth,
      ));
      indexAxis.parentData.offset = Offset(
        primaryAxisWidth,
        height - verticalAxisBottomPadding + plottingBottomPadding,
      );
    }

    for (final YgChartPlottingRenderer<AnyDataset> plotter in plotters) {
      plotter.parentData.padding = EdgeInsets.only(
        top: plottingTopPadding,
        bottom: plottingBottomPadding,
        left: plottingLeftPadding,
        right: plottingRightPadding,
      );
      plotter.layout(BoxConstraints.tightFor(
        width: plottingWidth,
        height: plottingHeight,
      ));
      plotter.parentData.offset = Offset(
        primaryAxisWidth,
        verticalAxisTopPadding - plottingTopPadding,
      );
    }

    for (final YgChartDecorationRenderer decorator in decorators) {
      decorator.parentData.padding = EdgeInsets.only(
        left: primaryAxisWidth + plottingLeftPadding,
        right: width - secondaryAxisWidth - plottingRightPadding,
        top: verticalAxisTopPadding,
        bottom: verticalAxisBottomPadding,
      );
      decorator.layout(BoxConstraints.tight(size));
    }

    // endregion
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final _Children(
      :List<YgChartPlottingRenderer<AnyDataset>> plotters,
      :YgChartIndexAxisRenderer? indexAxis,
      :YgChartValueAxisRenderer? primaryAxis,
      :YgChartValueAxisRenderer? secondaryAxis,
      :List<YgChartDecorationRenderer> decorators
    ) = _getChildren();

    for (final YgChartDecorationRenderer decorator in decorators) {
      context.paintChildDefault(decorator, offset);
    }

    for (final YgChartPlottingRenderer<AnyDataset> plotter in plotters) {
      context.paintChildDefault(plotter, offset);
    }

    if (indexAxis != null) {
      context.paintChildDefault(indexAxis, offset);
    }

    if (primaryAxis != null) {
      context.paintChildDefault(primaryAxis, offset);
    }

    if (secondaryAxis != null) {
      context.paintChildDefault(secondaryAxis, offset);
    }

    context.addLayer(_getLeaderLayer());
  }

  LeaderLayer _getLeaderLayer() {
    final LeaderLayer? leaderLayer = _leaderLayer;
    if (leaderLayer == null) {
      return _leaderLayer = LeaderLayer(
        link: _link,
      );
    }

    return leaderLayer;
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
      decorators: decorationRenderers,
      indexAxis: indexAxis,
      primaryAxis: primaryAxis,
      plotters: plottingRenderers,
      secondaryAxis: secondaryAxis,
    );
  }

  // We will repaint a lot and do not want that to go up the widget tree.
  @override
  bool get isRepaintBoundary => true;

  // We will layout a lot and do not want that to go up the widget tree.
  @override
  bool get sizedByParent => true;
}

class _Children {
  const _Children({
    required this.decorators,
    required this.indexAxis,
    required this.primaryAxis,
    required this.plotters,
    required this.secondaryAxis,
  });

  final List<YgChartPlottingRenderer<AnyDataset>> plotters;
  final List<YgChartDecorationRenderer> decorators;
  final YgChartValueAxisRenderer? primaryAxis;
  final YgChartValueAxisRenderer? secondaryAxis;
  final YgChartIndexAxisRenderer? indexAxis;
}

extension on PaintingContext {
  void paintChildDefault(
    ChartChildRenderer<YgChartParentData> child,
    Offset offset,
  ) {
    paintChild(
      child,
      offset + child.parentData.offset,
    );
  }
}
