import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';
import 'package:yggdrasil/src/components/yg_graph/models/horizontal_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_graph/models/vertical_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_graph/renderers/vertical_axis_renderers/yg_graph_vertical_axis_render_box.dart';

import 'renderers/background_renderers/yg_graph_background_render_box.dart';
import 'renderers/horizontal_axis_renderers/yg_graph_horizontal_axis_render_box.dart';
import 'renderers/plotting_area_renderers/yg_graph_plotting_area_render_box.dart';

class Yg2DGraph extends MultiChildRenderObjectWidget {
  const Yg2DGraph({
    super.key,
    required super.children,
    required this.indexRange,
    required this.valueRange,
  });

  final Range? indexRange;
  final Range? valueRange;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _Yg2DGraphRenderer();
  }
}

class Yg2DGraphParentData extends ContainerBoxParentData<RenderBox> {}

class _Yg2DGraphRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, Yg2DGraphParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, Yg2DGraphParentData> {
  _Yg2DGraphRenderer();

  Range? _indexRange;
  Range? get indexRange => _indexRange;
  set indexRange(Range? newValue) {
    if (newValue != _indexRange) {
      _indexRange = newValue;
      markNeedsLayout();
    }
  }

  Range? _valueRange;
  Range? get valueRange => _valueRange;
  set valueRange(Range? newValue) {
    if (newValue != _valueRange) {
      _valueRange = newValue;
      markNeedsLayout();
    }
  }

  @override
  void setupParentData(covariant RenderObject child) {
    switch (child) {
      case YgGraphHorizontalAxisRenderBox():
        if (child.parentData is! YgGraphHorizontalAxisParentData) {
          child.parentData = YgGraphHorizontalAxisParentData();
        }
      case YgGraphVerticalAxisRenderBox():
        if (child.parentData is! YgGraphVerticalAxisParentData) {
          child.parentData = YgGraphVerticalAxisParentData();
        }
      case YgGraphPlottingAreaRenderBox():
        if (child.parentData is! YgGraphPlottingAreaParentData) {
          child.parentData = YgGraphPlottingAreaParentData();
        }
      case YgGraphBackgroundRenderBox():
        if (child.parentData is! YgGraphBackgroundParentData) {
          child.parentData = YgGraphBackgroundParentData();
        }
      case RenderBox():
        if (child.parentData is! BoxParentData) {
          child.parentData = BoxParentData();
        }
    }
  }

  NamedRenderers get _namedRenderers {
    final List<YgGraphPlottingAreaRenderBox> plottingAreas = <YgGraphPlottingAreaRenderBox>[];
    final List<YgGraphVerticalAxisRenderBox> verticalLabelAreas = <YgGraphVerticalAxisRenderBox>[];
    final List<YgGraphHorizontalAxisRenderBox> horizontalLabelAreas = <YgGraphHorizontalAxisRenderBox>[];
    YgGraphHorizontalAxisRenderBox? topLabelArea;
    YgGraphHorizontalAxisRenderBox? bottomLabelArea;
    YgGraphVerticalAxisRenderBox? leftLabelArea;
    YgGraphVerticalAxisRenderBox? rightLabelArea;
    YgGraphBackgroundRenderBox? background;

    RenderBox? currentChild = firstChild;
    while (currentChild != null) {
      if (currentChild is YgGraphHorizontalAxisRenderBox) {
        switch (currentChild.getAlignment()) {
          case YgHorizontalAxisAlignment.top:
            assert(
              topLabelArea == null,
              'Multiple instances of YgHorizontalAxisRenderBox have an alignment of YgHorizontalAxisAlignment.top',
            );
            topLabelArea ??= currentChild;
            break;
          case YgHorizontalAxisAlignment.bottom:
            assert(
              bottomLabelArea == null,
              'Multiple instances of YgHorizontalAxisRenderBox have an alignment of YgHorizontalAxisAlignment.bottom',
            );
            bottomLabelArea ??= currentChild;
            break;
        }
        horizontalLabelAreas.add(currentChild);
      }
      if (currentChild is YgGraphVerticalAxisRenderBox) {
        switch (currentChild.getAlignment()) {
          case YgVerticalAxisAlignment.left:
            assert(
              leftLabelArea == null,
              'Multiple instances of YgVerticalAxisRenderBox have an alignment of YgVerticalAxisAlignment.left',
            );
            leftLabelArea ??= currentChild;
            break;
          case YgVerticalAxisAlignment.right:
            assert(
              rightLabelArea == null,
              'Multiple instances of YgVerticalAxisRenderBox have an alignment of YgVerticalAxisAlignment.right',
            );
            rightLabelArea ??= currentChild;
            break;
        }
        verticalLabelAreas.add(currentChild);
      }
      if (currentChild is YgGraphBackgroundRenderBox) {
        assert(
          background == null,
          'Multiple instances of YgGraphBackgroundRenderBox found',
        );
        background ??= currentChild;
      }
      if (currentChild is YgGraphPlottingAreaRenderBox) {
        plottingAreas.add(currentChild);
      }
      currentChild = childAfter(currentChild);
    }

    return NamedRenderers(
      plottingAreas: plottingAreas,
      horizontalLabelAreas: horizontalLabelAreas,
      verticalLabelAreas: verticalLabelAreas,
      topLabelArea: topLabelArea,
      bottomLabelArea: bottomLabelArea,
      leftLabelArea: leftLabelArea,
      rightLabelArea: rightLabelArea,
      background: background,
    );
  }

  @override
  void performLayout() {
    assert(
      constraints.hasBoundedHeight,
      'The constraints provided to the graph renderer must have a bounded height. Unbounded height constraints are not supported.',
    );
    assert(
      constraints.hasBoundedWidth,
      'The constraints provided to the graph renderer must have a bounded width. Unbounded width constraints are not supported.',
    );

    // We can not calculate the height of the components without a bound height
    // due to the complex layout of the graph.
    if (constraints.hasInfiniteHeight || constraints.hasInfiniteWidth) {
      size = constraints.smallest;

      return;
    }

    size = constraints.biggest;

    final NamedRenderers namedRenderers = _namedRenderers;
    final Range indexRange = _getIndexRange(namedRenderers.plottingAreas);
    final Range valueRange = _getValueRange(namedRenderers.plottingAreas);

    final PlottingAreaDimensionRequirements plottingAreaDimensionRequirements =
        _getPlottingAreaDimensionRequirements(namedRenderers);

    for (final YgGraphPlottingAreaRenderBox fieldRenderer in namedRenderers.plottingAreas) {}

    // if(namedRenderers.verticalLabelAreas.isNotEmpty) {
    //   final double maximumVerticalSectionWidth = (constraints.maxWidth - minPlottingAreaWidth) / namedRenderers.verticalLabelAreas.length;
    //   for(final YgGraphVerticalAxisRenderBox verticalSectionRenderer in namedRenderers.verticalLabelAreas) {
    //     verticalSectionRenderer.
    //   }

    // }

    // const double minFieldHeight = 0;

    // for(final YgGraphVerticalAxisRenderBox verticalSideRenderer in namedRenderers.verticalLabelAreas) {
    //   verticalSideRenderer.getMinHeightWithIntervals();
    // }

    // const double minFieldWidth = 0;
    //   for (final YgGraphPlottingAreaRenderBox fieldRenderer in namedRenderers.plottingAreas) {
    //     fieldRenderer.getMinIntrinsicWidth(height);
    //   }

    // final double width = constraints.maxWidth;
    // double height;
    // if (constraints.hasBoundedHeight) {
    //   height = constraints.maxHeight;
    // } else {
    //   height = constraints.minHeight;

    //   for (final YgGraphPlottingAreaRenderBox fieldRenderer in namedRenderers.plottingAreas) {}
    // }

    // final double leftSectionMinWidth = namedRenderers.leftLabelArea?.getMinIntrinsicWidth() ?? 0.0;
    // final double rightSectionMinWidth = namedRenderers.rightLabelArea?.getMinIntrinsicWidth() ?? 0.0;
    // final double topSectionMinHeight = namedRenderers.topLabelArea?.getMinIntrinsicHeight() ?? 0.0;
    // final double bottomSectionMinHeight = namedRenderers.bottomLabelArea?.getMinIntrinsicHeight() ?? 0.0;

    final EdgeInsets contentPadding = _getContentPadding(namedRenderers);

    super.performLayout();
  }

  PlottingAreaDimensionRequirements _getPlottingAreaDimensionRequirements(NamedRenderers namedRenderers) {
    double minWidth = 0.0;
    double minHeight = 0.0;

    double top = 0;
    double bottom = 0;
    double left = 0;
    double right = 0;

    for (final YgGraphPlottingAreaRenderBox fieldRenderer in namedRenderers.plottingAreas) {
      final Size minSize = fieldRenderer.getMinPlottingAreaSize();
      minWidth = max(minWidth, minSize.width);
      minHeight = max(minHeight, minSize.height);

      final EdgeInsets minPadding = fieldRenderer.getMinContentPadding();
      top = max(minPadding.top, top);
      bottom = max(minPadding.bottom, bottom);
      left = max(minPadding.left, left);
      right = max(minPadding.right, right);
    }

    final EdgeInsets padding = EdgeInsets.only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );

    return PlottingAreaDimensionRequirements(
        minSize: Size(minWidth, minHeight), padding: padding, minOuterSize: padding.inflateSize(size));
  }

  Range _getIndexRange(List<YgGraphPlottingAreaRenderBox> fieldRenderers) {
    final Range? indexRangeOverwrite = _indexRange;
    if (indexRangeOverwrite != null) {
      return indexRangeOverwrite;
    }

    Range range = fieldRenderers.first.getIndexRange();

    for (int i = 1; i < fieldRenderers.length; i++) {
      range = range.encapsulate(fieldRenderers[i].getIndexRange());
    }

    return range;
  }

  Range _getValueRange(List<YgGraphPlottingAreaRenderBox> fieldRenderers) {
    final Range? valueRangeOverwrite = _valueRange;
    if (valueRangeOverwrite != null) {
      return valueRangeOverwrite;
    }

    Range range = fieldRenderers.first.getValueRange();

    for (int i = 1; i < fieldRenderers.length; i++) {
      range = range.encapsulate(fieldRenderers[i].getValueRange());
    }

    return range;
  }

  EdgeInsets _getContentPadding(NamedRenderers namedRenderers) {
    double top = 0;
    double bottom = 0;
    double left = 0;
    double right = 0;

    for (final YgGraphPlottingAreaRenderBox fieldRenderer in namedRenderers.plottingAreas) {
      final EdgeInsets minPadding = fieldRenderer.getMinContentPadding();

      top = max(minPadding.top, top);
      bottom = max(minPadding.bottom, bottom);
      left = max(minPadding.left, left);
      right = max(minPadding.right, right);
    }

    final YgGraphHorizontalAxisRenderBox? bottomSection = namedRenderers.bottomLabelArea;
    if (bottomSection != null) {
      final HorizontalEdgeInsets minPadding = bottomSection.getMinHorizontalPadding();
      left = max(minPadding.left, left);
      right = max(minPadding.right, right);
    }

    final YgGraphHorizontalAxisRenderBox? topSection = namedRenderers.topLabelArea;
    if (topSection != null) {
      final HorizontalEdgeInsets minPadding = topSection.getMinHorizontalPadding();
      left = max(minPadding.left, left);
      right = max(minPadding.right, right);
    }

    final YgGraphVerticalAxisRenderBox? leftSection = namedRenderers.leftLabelArea;
    if (leftSection != null) {
      final VerticalEdgeInsets minPadding = leftSection.getMinVerticalPadding();
      top = max(minPadding.top, top);
      bottom = max(minPadding.bottom, bottom);
    }

    final YgGraphVerticalAxisRenderBox? rightSection = namedRenderers.rightLabelArea;
    if (rightSection != null) {
      final VerticalEdgeInsets minPadding = rightSection.getMinVerticalPadding();
      top = max(minPadding.top, top);
      bottom = max(minPadding.bottom, bottom);
    }

    return EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }
}

class NamedRenderers {
  const NamedRenderers({
    required this.plottingAreas,
    required this.horizontalLabelAreas,
    required this.verticalLabelAreas,
    required this.topLabelArea,
    required this.bottomLabelArea,
    required this.leftLabelArea,
    required this.rightLabelArea,
    required this.background,
  });

  final YgGraphHorizontalAxisRenderBox? topLabelArea;
  final YgGraphHorizontalAxisRenderBox? bottomLabelArea;

  final YgGraphVerticalAxisRenderBox? leftLabelArea;
  final YgGraphVerticalAxisRenderBox? rightLabelArea;

  final YgGraphBackgroundRenderBox? background;

  final List<YgGraphVerticalAxisRenderBox> verticalLabelAreas;
  final List<YgGraphHorizontalAxisRenderBox> horizontalLabelAreas;
  final List<YgGraphPlottingAreaRenderBox> plottingAreas;
}

class PlottingAreaDimensionRequirements {
  const PlottingAreaDimensionRequirements({
    required this.padding,
    required this.minSize,
    required this.minOuterSize,
  });

  final EdgeInsets padding;
  final Size minSize;
  final Size minOuterSize;
}
