import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Lays out the title, tag and trailing for the section header.
class YgSectionTitleBar extends MultiChildRenderObjectWidget {
  YgSectionTitleBar({
    super.key,
    required Widget title,
    Widget? tag,
    Widget? trailing,
    required this.gap,
    required this.minAvailableTagWidth,
  })  : tag = tag != null,
        trailing = trailing != null,
        super(
          children: <Widget>[
            title,
            if (tag != null) tag,
            if (trailing != null) trailing,
          ],
        );

  /// Whether there is a tag.
  final bool tag;

  /// Whether there is a trailing.
  final bool trailing;

  /// The gap between the widgets.
  final double gap;

  /// The minimum width that the tag should be allowed to use.
  ///
  /// This is not the minimum width of the tag, if the tag needs less space than
  /// this it will use less space. If the title does not take up all the
  /// available space the tag is allowed to expand beyond this amount. Only when
  /// both the title and tag take up more than the available width will this
  /// number dictate the width of the tag.
  final double minAvailableTagWidth;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSectionTitleBarRenderer(
      tag: tag,
      trailing: trailing,
      gap: gap,
      minAvailableTagWidth: minAvailableTagWidth,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSectionTitleBarRenderer renderObject) {
    renderObject.tag = tag;
    renderObject.trailing = trailing;
    renderObject.minAvailableTagWidth = minAvailableTagWidth;
    renderObject.gap = gap;
  }
}

class YgSectionTitleBarParentData extends ContainerBoxParentData<RenderBox> {}

class YgSectionTitleBarRenderer extends RenderBox
    with ContainerRenderObjectMixin<RenderBox, YgSectionTitleBarParentData> {
  YgSectionTitleBarRenderer({
    required bool tag,
    required bool trailing,
    required double minAvailableTagWidth,
    required double gap,
  })  : _trailing = trailing,
        _tag = tag,
        _minAvailableTagWidth = minAvailableTagWidth,
        _gap = gap;

  // region Values

  double _minAvailableTagWidth;
  double get minAvailableTagWidth => _minAvailableTagWidth;
  set minAvailableTagWidth(double newValue) {
    if (_minAvailableTagWidth != newValue) {
      _minAvailableTagWidth = newValue;
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

  bool _tag;
  bool get tag => _tag;
  set tag(bool newValue) {
    if (_tag != newValue) {
      _tag = newValue;
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

  // endregion

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgSectionTitleBarParentData();
  }

  @override
  void performLayout() {
    final RenderBox? title = firstChild;

    // If there's no title, exit the function early.
    if (title == null) {
      return;
    }

    // Get the tag and trailing widgets if they exist.
    final RenderBox? tag = _tag ? childAfter(title) : null;
    final RenderBox? trailing = _trailing ? lastChild : null;

    // Create a new set of constraints for the children. This allows the child
    // widgets to have a width as small as they want.
    final BoxConstraints constraints = this.constraints.copyWith(
          minWidth: 0,
        );

    // Initialize the available width and height.
    double availableWidth = constraints.maxWidth;
    double height = 0;

    // Layout the trailing widget if it exists.
    if (trailing != null) {
      trailing.layout(constraints, parentUsesSize: true);

      // Calculate the total width of the trailing widget and the gap and
      // subtract this from the available width.
      final double totalWidth = trailing.size.width + _gap;
      availableWidth -= totalWidth;

      // Save the offset of the trailing widget.
      trailing.offset = Offset(
        constraints.maxWidth - totalWidth,
        0,
      );

      // Update the height if the trailing widget is taller than the current
      // height to ensure the bar is tall enough to contain all its children.
      height = max(height, trailing.size.height);
    }

    // Calculate the the minimum amount of space which will be used by the tag.
    if (tag != null) {
      availableWidth -= _gap;

      final Size preferredSize = tag.getDryLayout(
        constraints.copyWith(
          maxWidth: availableWidth,
        ),
      );

      // Calculate the minimum width for the tag. Ensures the tag gets at least
      // the minimum amount of space required by the design or half of the
      // available space in very constrained circumstances.
      final double minimumWidth = min(
        min(
          _minAvailableTagWidth,
          preferredSize.width,
        ),
        availableWidth * 0.5,
      );

      // Subtract the minimum width from the available width.
      availableWidth -= minimumWidth;
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

    // Layout the tag with the space not used by either the title or trailing
    // widget.
    if (tag != null) {
      double offset = constraints.maxWidth - _gap;

      if (trailing != null) {
        offset -= trailing.size.width + _gap;
      }

      tag.layout(
        constraints.copyWith(
          maxWidth: offset - (title.size.width + _gap),
        ),
        parentUsesSize: true,
      );

      // Update the height if the tag is taller than the current height to
      // ensure the bar is tall enough to contain all its children.
      height = max(height, tag.size.height);

      // Save the offset of the tag.
      tag.offset = Offset(
        offset - tag.size.width,
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
    // Loop through every child and paint it using the saved offset.
    RenderBox? child = firstChild;
    while (child != null) {
      child.paint(context, offset + child.offset);
      child = childAfter(child);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    // Loop through every child until a hit has been detected using the saved
    // offset.
    RenderBox? child = firstChild;
    while (child != null) {
      if (child.hitTest(result, position: position - child.offset)) {
        return true;
      }
      child = childAfter(child);
    }

    return false;
  }

  @override
  void applyPaintTransform(covariant RenderObject child, Matrix4 transform) {
    // Translate the transform using the saved offset.
    transform.translate(
      child.offset.dx,
      child.offset.dy,
    );
  }
}

/// Private extension to make interacting with parentData easier.
extension on RenderObject {
  Offset get offset => data.offset;
  set offset(Offset newOffset) {
    data.offset = newOffset;
  }

  YgSectionTitleBarParentData get data => (parentData as YgSectionTitleBarParentData);
}
