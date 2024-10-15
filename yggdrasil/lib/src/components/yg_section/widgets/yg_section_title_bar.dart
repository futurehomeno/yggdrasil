import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Lays out the title, trailing and internal trailing widgets for the section header.
///
/// We cannot use simple rows with flexible widgets here.
/// Both the title and trailing contain text that will compete for the space.
/// To ensure that the title takes up as much space as needed, and that the
/// trailing has a min size, but takes up more space if title allows it, a
/// custom renderer was needed.
class YgSectionTitleBar extends MultiChildRenderObjectWidget {
  YgSectionTitleBar({
    super.key,
    required Widget title,
    Widget? trailing,
    Widget? trailingInternal,
    required this.gap,
    required this.minAvailableTrailingWidth,
  })  : trailing = trailing != null,
        trailingInternal = trailingInternal != null,
        super(
          children: <Widget>[
            title,
            if (trailing != null) trailing,
            if (trailingInternal != null) trailingInternal,
          ],
        );

  /// Whether there is a trailing widget.
  final bool trailing;

  /// Whether there is a internal trailing widget.
  final bool trailingInternal;

  /// The gap between the widgets.
  final double gap;

  /// The minimum width that the trailing widget should be allowed to use.
  ///
  /// This is not the minimum width of the trailing widget, if the trailing
  /// widget needs less space than this it will use less space. If the title
  /// does not take up all the available space the trailing widget is allowed
  /// to expand beyond this amount. Only when both the title and trailing take
  /// up more than the available width will this number dictate the width of the
  /// trailing widget.
  final double minAvailableTrailingWidth;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSectionTitleBarRenderer(
      trailing: trailing,
      trailingInternal: trailingInternal,
      gap: gap,
      minAvailableTrailingWidth: minAvailableTrailingWidth,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSectionTitleBarRenderer renderObject) {
    renderObject.trailing = trailing;
    renderObject.trailingInternal = trailingInternal;
    renderObject.minAvailableTrailingWidth = minAvailableTrailingWidth;
    renderObject.gap = gap;
  }
}

class YgSectionTitleBarParentData extends ContainerBoxParentData<RenderBox> {}

class YgSectionTitleBarRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgSectionTitleBarParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgSectionTitleBarParentData> {
  YgSectionTitleBarRenderer({
    required bool trailing,
    required bool trailingInternal,
    required double minAvailableTrailingWidth,
    required double gap,
  })  : _trailingInternal = trailingInternal,
        _trailing = trailing,
        _minAvailableTrailingWidth = minAvailableTrailingWidth,
        _gap = gap;

  // region Values

  double _minAvailableTrailingWidth;
  double get minAvailableTrailingWidth => _minAvailableTrailingWidth;
  set minAvailableTrailingWidth(double newValue) {
    if (_minAvailableTrailingWidth != newValue) {
      _minAvailableTrailingWidth = newValue;
      markNeedsLayout();
    }
  }

  double _gap;
  double get gap => _gap;
  set gap(double newValue) {
    if (_gap != newValue) {
      _gap = newValue;
      markNeedsLayout();
    }
  }

  bool _trailing;
  bool get trailing => _trailing;
  set trailing(bool newValue) {
    if (_trailing != newValue) {
      _trailing = newValue;
      markNeedsLayout();
    }
  }

  bool _trailingInternal;
  bool get trailingInternal => _trailingInternal;
  set trailingInternal(bool newValue) {
    if (_trailingInternal != newValue) {
      _trailingInternal = newValue;
      markNeedsLayout();
    }
  }

  // endregion

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! YgSectionTitleBarParentData) {
      child.parentData = YgSectionTitleBarParentData();
    }
  }

  @override
  void performLayout() {
    final RenderBox? title = firstChild;

    // If there's no title, exit the function early.
    if (title == null) {
      return;
    }

    // Get the trailing and internal trailing widgets if they exist.
    final RenderBox? trailing = _trailing ? childAfter(title) : null;
    final RenderBox? trailingInternal = _trailingInternal ? lastChild : null;

    // Create a new set of constraints for the children. This allows the child
    // widgets to have a width as small as they want.
    final BoxConstraints constraints = this.constraints.copyWith(
          minWidth: 0,
        );

    // Initialize the available width and height.
    double availableWidth = constraints.maxWidth;
    double height = 0;

    // Layout the trailing widget if it exists.
    if (trailingInternal != null) {
      trailingInternal.layout(constraints, parentUsesSize: true);

      // Calculate the total width of the trailing widget and the gap and
      // subtract this from the available width.
      final double totalWidth = trailingInternal.size.width + _gap;
      availableWidth -= totalWidth;

      // Save the offset of the trailing widget.
      trailingInternal.data.offset = Offset(
        constraints.maxWidth - totalWidth,
        0,
      );

      // Update the height if the trailing widget is taller than the current
      // height to ensure the bar is tall enough to contain all its children.
      height = max(height, trailingInternal.size.height);
    }

    // Calculate the the minimum amount of space which will be used by the
    // trailing widget.
    if (trailing != null) {
      final Size preferredSize = trailing.getDryLayout(
        constraints.copyWith(
          maxWidth: availableWidth - _gap,
        ),
      );

      // Calculate the minimum width for the trailing widget. Ensures the
      // trailing widget gets at least the minimum amount of space required by
      // the design or half of the available space in very constrained circumstances.
      final double minimumWidth = min(
        min(
          _minAvailableTrailingWidth + _gap,
          preferredSize.width,
        ),
        availableWidth * 0.5,
      );

      // Subtract the minimum width from the available width.
      availableWidth -= minimumWidth + _gap;
    }

    // Layout the title with the remaining width.
    title.layout(
      constraints.copyWith(
        maxWidth: availableWidth,
      ),
      parentUsesSize: true,
    );

    // Update the height if the title is taller than the current height to
    // ensure the bar is tall enough to contain all its children.
    height = max(height, title.size.height);

    // Layout the trailing widget with the space not used by either the title or
    // internal trailing widget.
    if (trailing != null) {
      double offset = constraints.maxWidth - _gap;

      if (trailingInternal != null) {
        offset -= trailingInternal.size.width + _gap;
      }

      trailing.layout(
        constraints.copyWith(
          maxWidth: offset - (title.size.width + _gap),
        ),
        parentUsesSize: true,
      );

      // Update the height if the trailing widget is taller than the current
      // height to ensure the bar is tall enough to contain all its children.
      height = max(height, trailing.size.height);

      // Save the offset of the trailing widget.
      trailing.data.offset = Offset(
        offset - trailing.size.width,
        0,
      );
    }

    // Set the size of the render object.
    size = Size(
      constraints.maxWidth,
      height,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  double? computeDistanceToFirstActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToFirstActualBaseline(baseline);
  }

  double? computeDistanceToHighestActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}

/// Private extension to make interacting with parentData easier.
extension on RenderObject {
  YgSectionTitleBarParentData get data => (parentData as YgSectionTitleBarParentData);
}
