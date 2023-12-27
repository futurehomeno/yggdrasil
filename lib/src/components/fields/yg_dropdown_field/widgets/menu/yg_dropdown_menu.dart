import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/yg_dropdown_field/widgets/menu/yg_menu_overlay_follower.dart';
import 'package:yggdrasil/src/utils/yg_overlay/_yg_overlay.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_dropdown_menu_content.dart';

class YgDropdownMenu<T extends Object> extends StatefulWidget {
  const YgDropdownMenu({
    super.key,
    required this.controller,
    required this.entries,
    required this.opened,
    required this.animationCurve,
    required this.animationDuration,
    required this.child,
    required this.padding,
  });

  final YgDynamicDropdownController<T> controller;
  final List<YgDropdownEntry<T>> entries;
  final bool opened;
  final Curve animationCurve;
  final Duration animationDuration;
  final Widget child;
  final double padding;

  @override
  State<YgDropdownMenu<T>> createState() => _YgDropdownMenuState<T>();
}

class _YgDropdownMenuState<T extends Object> extends State<YgDropdownMenu<T>> with TickerProviderStateMixin {
  final YgOverlayLink _link = YgOverlayLink();

  final OverlayPortalController _portalController = OverlayPortalController();

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    value: widget.opened ? 1 : 0,
  );

  @override
  void initState() {
    super.initState();
    if (widget.opened) {
      _portalController.show();
    }
    _animationController.addListener(_updatePortal);
  }

  void _updatePortal() {
    final bool shouldShow = _animationController.value > 0;

    if (_portalController.isShowing != shouldShow) {
      if (shouldShow) {
        _portalController.show();
      } else {
        _portalController.hide();
      }
    }
  }

  @override
  void dispose() {
    _portalController.hide();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YgDropdownMenu<T> oldWidget) {
    if (oldWidget.opened != widget.opened) {
      _animationController.animateTo(
        widget.opened ? 1.0 : 0.0,
        curve: widget.animationCurve,
        duration: widget.animationDuration,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _portalController,
      overlayChildBuilder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.controller.close,
            ),
            YgMenuOverlayFollower(
              animation: _animationController,
              link: _link,
              padding: widget.padding,
              child: YgDropdownMenuContent<T>(
                entries: widget.entries,
                controller: widget.controller,
              ),
            ),
          ],
        );
      },
      child: YgOverlayTarget(
        overlayLink: _link,
        child: widget.child,
      ),
    );
  }
}
