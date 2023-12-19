import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_overlay/yg_overlay_follower.dart';
import 'package:yggdrasil/src/components/yg_overlay/yg_overlay_link.dart';
import 'package:yggdrasil/src/components/yg_overlay/yg_overlay_target.dart';

typedef OverlayConstrainer = BoxConstraints Function(Rect parent, BoxConstraints constraints);
typedef OverlayPositioner = Offset Function(Rect parent, BoxConstraints constraints, Size childSize);

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

  final OverlayConstrainer? constrainOverlay;
  final OverlayPositioner? positionOverlay;
  final OverlayPortalController controller;
  final WidgetBuilder overlayChildBuilder;
  final Widget child;
  final VoidCallback? onTapOutsideOverlay;

  @override
  State<YgOverlay> createState() => _YgOverlayState();
}

class _YgOverlayState extends State<YgOverlay> {
  final YgOverlayLink _overlayLink = YgOverlayLink();

  @override
  void dispose() {
    _overlayLink.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OverlayState overlay = Overlay.of(context);

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
              child: YgOverlayFollower(
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
        overlay: overlay,
        overlayLink: _overlayLink,
        child: widget.child,
      ),
    );
  }
}
