import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_overlay/yg_overlay_link.dart';
import 'package:yggdrasil/src/utils/yg_overlay/yg_overlay_target.dart';

import 'yg_overlay_portal_follower.dart';

typedef OverlayConstrainer = BoxConstraints Function(Rect parent, BoxConstraints constraints);
typedef OverlayPositioner = Offset Function(Rect parent, BoxConstraints constraints, Size childSize);

/// Allows you to attach an overlay to the child widget.
class YgOverlay extends StatefulWidget {
  const YgOverlay({
    super.key,
    required this.overlayChildBuilder,
    required this.child,
    required this.controller,
    this.constrainOverlay,
    this.positionOverlay,
    this.onTapOutsideOverlay,
  });

  /// Calculates the [BoxConstraints] of the child widget.
  final OverlayConstrainer? constrainOverlay;

  /// Calculates the [Offset] of the child widget.
  final OverlayPositioner? positionOverlay;

  /// Controls whether the overlay child is rendered or not.
  final OverlayPortalController controller;

  /// Builds the overlay child.
  final WidgetBuilder overlayChildBuilder;

  /// The child widget to which the overlay child will be attached.
  final Widget child;

  /// Called when the user taps outside of the overlay child.
  final VoidCallback? onTapOutsideOverlay;

  @override
  State<YgOverlay> createState() => _YgOverlayState();
}

class _YgOverlayState extends State<YgOverlay> {
  final YgOverlayLink _overlayLink = YgOverlayLink();

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: widget.controller,
      overlayChildBuilder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widget.onTapOutsideOverlay,
              ),
            ),
            Positioned.fill(
              child: YgOverlayPortalFollower(
                positionOverlay: widget.positionOverlay,
                constrainOverlay: widget.constrainOverlay,
                overlayLink: _overlayLink,
                child: widget.overlayChildBuilder(
                  context,
                ),
              ),
            ),
          ],
        );
      },
      child: YgOverlayTarget(
        overlayLink: _overlayLink,
        child: widget.child,
      ),
    );
  }
}
