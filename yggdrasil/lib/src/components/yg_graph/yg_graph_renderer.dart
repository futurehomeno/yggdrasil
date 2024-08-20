import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';
import 'package:yggdrasil/src/components/yg_graph/models/horizontal_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_graph/models/vertical_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_graph/renderers/vertical_axis_renderers/yg_graph_vertical_axis_render_box.dart';

import 'renderers/background_renderers/yg_graph_background_render_box.dart';
import 'renderers/field_renderers/yg_graph_field_render_box.dart';
import 'renderers/horizontal_axis_renderers/yg_graph_horizontal_axis_render_box.dart';

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
        if (child.parentData is! YgHorizontalAxisParentData) {
          child.parentData = YgHorizontalAxisParentData();
        }
      case YgGraphVerticalAxisRenderBox():
        if (child.parentData is! YgVerticalAxisParentData) {
          child.parentData = YgVerticalAxisParentData();
        }
      case YgGraphFieldRenderBox():
        if (child.parentData is! YgGraphFieldParentData) {
          child.parentData = YgGraphFieldParentData();
        }
      case RenderBox():
        if (child.parentData is! BoxParentData) {
          child.parentData = BoxParentData();
        }
    }
  }

  NamedRenderers get _namedRenderers {
    final List<YgGraphFieldRenderBox> fieldRenderers = <YgGraphFieldRenderBox>[];
    YgGraphHorizontalAxisRenderBox? topSection;
    YgGraphHorizontalAxisRenderBox? bottomSection;
    YgGraphVerticalAxisRenderBox? leftSection;
    YgGraphVerticalAxisRenderBox? rightSection;
    YgGraphBackgroundRenderBox? background;

    RenderBox? currentChild = firstChild;
    while (currentChild != null) {
      if (currentChild is YgGraphHorizontalAxisRenderBox) {
        switch (currentChild.getAlignment()) {
          case YgHorizontalAxisAlignment.top:
            assert(
              topSection == null,
              'Multiple instances of YgHorizontalAxisRenderBox have an alignment of YgHorizontalAxisAlignment.top',
            );
            topSection ??= currentChild;
            break;
          case YgHorizontalAxisAlignment.bottom:
            assert(
              bottomSection == null,
              'Multiple instances of YgHorizontalAxisRenderBox have an alignment of YgHorizontalAxisAlignment.bottom',
            );
            bottomSection ??= currentChild;
            break;
        }
      }
      if (currentChild is YgGraphVerticalAxisRenderBox) {
        switch (currentChild.getAlignment()) {
          case YgVerticalAxisAlignment.left:
            assert(
              leftSection == null,
              'Multiple instances of YgVerticalAxisRenderBox have an alignment of YgVerticalAxisAlignment.left',
            );
            leftSection ??= currentChild;
            break;
          case YgVerticalAxisAlignment.right:
            assert(
              rightSection == null,
              'Multiple instances of YgVerticalAxisRenderBox have an alignment of YgVerticalAxisAlignment.right',
            );
            rightSection ??= currentChild;
            break;
        }
      }
      if (currentChild is YgGraphBackgroundRenderBox) {
        assert(
          background == null,
          'Multiple instances of YgGraphBackgroundRenderBox found',
        );
        background ??= currentChild;
      }
      if (currentChild is YgGraphFieldRenderBox) {
        fieldRenderers.add(currentChild);
      }
      currentChild = childAfter(currentChild);
    }

    return NamedRenderers(
      fieldRenderers: fieldRenderers,
      topSection: topSection,
      bottomSection: bottomSection,
      leftSection: leftSection,
      rightSection: rightSection,
      background: background,
    );
  }

  @override
  void performLayout() {
    final NamedRenderers namedRenderers = _namedRenderers;
    final Range indexRange = _getIndexRange(namedRenderers.fieldRenderers);
    final Range valueRange = _getValueRange(namedRenderers.fieldRenderers);

    final double leftSectionMinWidth = namedRenderers.leftSection?.getMinLabelAreaWidth() ?? 0.0;
    final double rightSectionMinWidth = namedRenderers.rightSection?.getMinLabelAreaWidth() ?? 0.0;
    final double topSectionMinHeight = namedRenderers.topSection?.getMinLabelAreaHeight() ?? 0.0;
    final double bottomSectionMinHeight = namedRenderers.bottomSection?.getMinLabelAreaHeight() ?? 0.0;

    final EdgeInsets contentPadding = _getContentPadding(namedRenderers);

    super.performLayout();
  }

  Range _getIndexRange(List<YgGraphFieldRenderBox> fieldRenderers) {
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

  Range _getValueRange(List<YgGraphFieldRenderBox> fieldRenderers) {
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

    for (final YgGraphFieldRenderBox fieldRenderer in namedRenderers.fieldRenderers) {
      final EdgeInsets minPadding = fieldRenderer.getMinContentPadding();

      top = max(minPadding.top, top);
      bottom = max(minPadding.bottom, bottom);
      left = max(minPadding.left, left);
      right = max(minPadding.right, right);
    }

    final YgGraphHorizontalAxisRenderBox? bottomSection = namedRenderers.bottomSection;
    if (bottomSection != null) {
      final HorizontalEdgeInsets minPadding = bottomSection.getMinHorizontalPadding();
      left = max(minPadding.left, left);
      right = max(minPadding.right, right);
    }

    final YgGraphHorizontalAxisRenderBox? topSection = namedRenderers.topSection;
    if (topSection != null) {
      final HorizontalEdgeInsets minPadding = topSection.getMinHorizontalPadding();
      left = max(minPadding.left, left);
      right = max(minPadding.right, right);
    }

    final YgGraphVerticalAxisRenderBox? leftSection = namedRenderers.leftSection;
    if (leftSection != null) {
      final VerticalEdgeInsets minPadding = leftSection.getMinVerticalPadding();
      top = max(minPadding.top, top);
      bottom = max(minPadding.bottom, bottom);
    }

    final YgGraphVerticalAxisRenderBox? rightSection = namedRenderers.rightSection;
    if (rightSection != null) {
      final VerticalEdgeInsets minPadding = rightSection.getMinVerticalPadding();
      top = max(minPadding.top, top);
      bottom = max(minPadding.bottom, bottom);
    }

    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }
}

class NamedRenderers {
  const NamedRenderers({
    required this.fieldRenderers,
    required this.topSection,
    required this.bottomSection,
    required this.leftSection,
    required this.rightSection,
    required this.background,
  });

  final YgGraphHorizontalAxisRenderBox? topSection;
  final YgGraphHorizontalAxisRenderBox? bottomSection;

  final YgGraphVerticalAxisRenderBox? leftSection;
  final YgGraphVerticalAxisRenderBox? rightSection;

  final YgGraphBackgroundRenderBox? background;
  final List<YgGraphFieldRenderBox> fieldRenderers;
}
