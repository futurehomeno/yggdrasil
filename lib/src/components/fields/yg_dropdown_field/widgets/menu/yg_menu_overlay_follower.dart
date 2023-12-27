import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/yg_overlay/_yg_overlay.dart';

class YgMenuOverlayFollower extends SingleChildRenderObjectWidget {
  const YgMenuOverlayFollower({
    super.key,
    super.child,
    required this.link,
    required this.animation,
    required this.padding,
  });

  final YgOverlayLink link;
  final Animation<double> animation;
  final double padding;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgMenuOverlayFollowerRenderer(
      screenPadding: MediaQuery.paddingOf(context),
      overlay: Overlay.of(context),
      overlayLink: link,
      animation: animation,
      padding: padding,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgMenuOverlayFollowerRenderer renderObject) {
    renderObject.screenPadding = MediaQuery.paddingOf(context);
    renderObject.overlay = Overlay.of(context);
    renderObject.overlayLink = link;
    renderObject.animation = animation;
    renderObject.padding = padding;
  }
}

class YgMenuOverlayFollowerRenderer extends YgOverlayFollowerRenderer {
  YgMenuOverlayFollowerRenderer({
    required super.overlayLink,
    required super.overlay,
    required Animation<double> animation,
    required double padding,
    required EdgeInsets screenPadding,
  })  : _animation = animation,
        _padding = padding,
        _screenPadding = screenPadding;

  Animation<double> _animation;
  Animation<double> get animation => _animation;
  set animation(Animation<double> newAnimation) {
    if (animation != newAnimation) {
      markNeedsLayout();
      animation.removeListener(markNeedsLayout);
      newAnimation.addListener(markNeedsLayout);
      _animation = newAnimation;
    }
  }

  double _padding;
  double get padding => _padding;
  set padding(double padding) {
    if (_padding != padding) {
      _padding = padding;
      markNeedsLayout();
    }
  }

  EdgeInsets _screenPadding;
  EdgeInsets get screenPadding => _screenPadding;
  set screenPadding(EdgeInsets padding) {
    if (_screenPadding != padding) {
      _screenPadding = padding;
      markNeedsLayout();
    }
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _animation.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _animation.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void layoutChild(RenderBox child, Rect target) {
    final double spaceToScreenBottom = constraints.maxHeight - target.bottom - screenPadding.bottom - (padding * 2);
    final double spaceToScreenTop = target.top - screenPadding.top - (padding * 2);
    final double maxHeight = max(spaceToScreenTop, spaceToScreenBottom);

    final Size targetSize = child.getDryLayout(
      BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: target.width,
        minWidth: target.width,
      ),
    );

    child.layout(
      BoxConstraints(
        maxHeight: targetSize.height * animation.value,
        maxWidth: target.width,
        minWidth: target.width,
      ),
      parentUsesSize: true,
    );

    // Since the child is constrained to either the top or bottom, if it's more
    // than bottom, it has to be top.
    childOffset = Offset(
      target.left,
      targetSize.height > spaceToScreenBottom ? target.top - child.size.height - padding : target.bottom + padding,
    );
  }
}
