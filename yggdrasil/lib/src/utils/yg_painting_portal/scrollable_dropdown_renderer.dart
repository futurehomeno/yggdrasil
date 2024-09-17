import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'painting_portal_target.dart';

class ScrollableDropdownRenderer extends MultiChildRenderObjectWidget {
  ScrollableDropdownRenderer({
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
    return PaintingPortalSourceRenderer(
      alignment: alignment,
      gap: gap,
    );
  }
}

class PaintingPortalSourceParentData extends ContainerBoxParentData<RenderBox> {}

class PaintingPortalSourceRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, PaintingPortalSourceParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, PaintingPortalSourceParentData> {
  PaintingPortalSourceRenderer({
    required DropDownAlignment alignment,
    required double gap,
  })  : _alignment = alignment,
        _gap = gap;

  final LayerLink _link = LayerLink();

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
    child.parentData = PaintingPortalSourceParentData();
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

    _target?.updateEntry(
      this,
      PaintingPortalEntry(
        link: _link,
        follower: follower,
      ),
    );
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
  void detach() {
    _target?.removeEntry(this);
    super.detach();
  }
}

enum DropDownAlignment {
  top,
  bottom,
  auto,
}
