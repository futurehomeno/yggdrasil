import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Renders a list of widgets in a row.
///
/// This row keeps in mind the desired size of every widget and tries to equally
/// divide the available space between all [children] without giving a widget
/// more than its max intrinsic width and without leaving gaps between widgets.
class YgPickerRow extends MultiChildRenderObjectWidget {
  const YgPickerRow({
    super.key,
    required super.children,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgRowRenderer();
  }
}

class YgRowRendererParentData extends ContainerBoxParentData<RenderBox> {}

class YgRowRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgRowRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgRowRendererParentData> {
  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgRowRendererParentData();
  }

  @override
  void performLayout() {
    final List<RenderBox> children = getChildrenAsList();
    final List<_ChildWidthPair> sizeObjectList = <_ChildWidthPair>[];

    // Populate the sizeObjectList with SizeObjects
    for (final RenderBox child in children) {
      sizeObjectList.add(
        _ChildWidthPair(
          child: child,
          width: child.getMaxIntrinsicWidth(double.infinity),
        ),
      );
    }

    // Sort the sizeObjectList based on width. This is necessary because we want
    // to allocate the available width to the children starting from the
    // smallest one. This ensures that smaller children are not starved of space
    // by larger ones.
    sizeObjectList.sort((_ChildWidthPair a, _ChildWidthPair b) {
      return a.width.compareTo(b.width);
    });

    final Map<RenderBox, double> computedWidthMap = <RenderBox, double>{};
    double remainingMaxWidth = constraints.maxWidth;
    double totalChildWidth = 0;

    // Calculate the width for each child and store it in computedWidthMap.
    for (int i = 0; i < sizeObjectList.length; i++) {
      final _ChildWidthPair sizeObject = sizeObjectList[i];

      final double currentAvailableWidth = remainingMaxWidth / (sizeObjectList.length - i);
      computedWidthMap[sizeObject.child] = min(currentAvailableWidth, sizeObject.width);
      remainingMaxWidth -= sizeObject.width;
      totalChildWidth += sizeObject.width;
    }

    // If there is remaining minWidth, distribute it equally between the first
    // and last child.
    final double remainingMinWidth = constraints.minWidth - totalChildWidth;
    if (remainingMinWidth > 0) {
      final double firstWidth = computedWidthMap[children.first] ?? 0;
      computedWidthMap[children.first] = firstWidth + (remainingMinWidth / 2);
      final double lastWidth = computedWidthMap[children.last] ?? 0;
      computedWidthMap[children.last] = lastWidth + (remainingMinWidth / 2);
    }

    // Layout each child with the computed width.
    for (final MapEntry<RenderBox, double> entry in computedWidthMap.entries) {
      entry.key.layout(
        constraints.copyWith(
          minHeight: 0,
          maxWidth: entry.value,
          minWidth: entry.value,
        ),
        parentUsesSize: true,
      );
    }

    double width = 0;
    double height = 0;

    // Calculate the total width and maximum height of this widget.
    for (final RenderBox child in children) {
      width += child.size.width;
      if (child.size.height > height) {
        height = child.size.height;
      }
    }

    // Calculate and set the offset of each child.
    double xOffset = (max(width, constraints.minWidth) - width) / 2;
    for (final RenderBox child in children) {
      final YgRowRendererParentData data = (child.parentData as YgRowRendererParentData);
      data.offset = Offset(
        xOffset,
        (height - child.size.height) / 2,
      );
      xOffset += child.size.width;
    }

    size = constraints.constrain(
      Size(
        width,
        height,
      ),
    );
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToFirstActualBaseline(baseline);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    return defaultPaint(
      context,
      offset,
    );
  }
}

class _ChildWidthPair {
  const _ChildWidthPair({
    required this.child,
    required this.width,
  });

  final RenderBox child;
  final double width;
}
