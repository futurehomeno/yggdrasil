import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'painting_portal_target.dart';

class ScrollableDropdown extends MultiChildRenderObjectWidget {
  ScrollableDropdown({
    super.key,
    required Widget target,
    required Widget follower,
    required this.alignment,
    required this.gap,
  }) : super(
          children: <Widget>[
            target,
            follower,
          ],
        );

  final DropDownAlignment alignment;
  final double gap;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ScrollableDropdownRenderer(
      alignment: alignment,
      gap: gap,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant ScrollableDropdownRenderer renderObject) {
    renderObject.alignment = alignment;
    renderObject.gap = gap;
  }
}

class ScrollableDropdownData extends ContainerBoxParentData<RenderBox> {}

class ScrollableDropdownRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, ScrollableDropdownData>,
        RenderBoxContainerDefaultsMixin<RenderBox, ScrollableDropdownData> {
  ScrollableDropdownRenderer({
    required DropDownAlignment alignment,
    required double gap,
  })  : _alignment = alignment,
        _gap = gap;

  final LayerLink _link = LayerLink();
  PaintingContext? followerPaintingContext;

  DropDownAlignment _alignment;
  DropDownAlignment get alignment => _alignment;
  set alignment(DropDownAlignment newAlignment) {
    if (_alignment != newAlignment) {
      _alignment = newAlignment;
      markNeedsLayout();
    }
  }

  double _gap;
  double get gap => _gap;
  set gap(double newGap) {
    if (_gap != newGap) {
      _gap = newGap;
      markNeedsLayout();
    }
  }

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = ScrollableDropdownData();
  }

  @override
  void performLayout() {
    final RenderBox? followed = firstChild;
    final RenderBox? follower = lastChild;
    final PaintingPortalTargetRenderer? target = _target;

    if (followed == null || follower == null || target == null) {
      return;
    }

    followed.layout(constraints, parentUsesSize: true);
    follower.layout(BoxConstraints(
      maxHeight: double.infinity,
      minHeight: 0,
      maxWidth: followed.size.width,
      minWidth: followed.size.width,
    ));
    size = followed.size;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? target = firstChild;
    final RenderBox? follower = lastChild;
    final PaintingContext? followerPaintingContext = this.followerPaintingContext;

    if (target == null || follower == null) {
      return;
    }

    /// Either create or update the [LeaderLayer] used to position the value indicator.
    if (layer == null) {
      layer = LeaderLayer(
        link: _link,
        offset: offset,
      );
    } else {
      final LeaderLayer leaderLayer = layer! as LeaderLayer;
      leaderLayer
        ..link = _link
        ..offset = offset;
    }

    /// Add the [LeaderLayer] to the current painting context.
    context.pushLayer(
      layer!,
      target.paint,
      Offset.zero,
    );

    if (followerPaintingContext != null) {
      followerPaintingContext.paintChild(
        follower,
        Offset.zero,
      );
    }
  }

  PaintingPortalTargetRenderer? get _target {
    for (RenderObject? target = parent; target != null; target = target.parent) {
      if (target is PaintingPortalTargetRenderer) {
        return target;
      }
    }

    return null;
  }

  @override
  bool get needsCompositing => true;

  @override
  void attach(PipelineOwner owner) {
    _target?.addEntry(this);
    super.attach(owner);
  }

  @override
  void detach() {
    _target?.removeEntry(this);
    super.detach();
  }

  FollowerLayer createLayer() {
    return FollowerLayer(link: _link);
  }
}

enum DropDownAlignment {
  top,
  bottom,
  auto,
}
