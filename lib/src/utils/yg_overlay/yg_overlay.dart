import 'package:flutter/material.dart';

import 'yg_overlay_portal_follower.dart';
import 'yg_overlay_render_widget.dart';

class YgOverlay extends StatefulWidget {
  const YgOverlay({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<YgOverlay> createState() => YgOverlayState();
}

class YgOverlayState extends State<YgOverlay> {
  final Set<YgOverlayPortalFollower> _entries = <YgOverlayPortalFollower>{};

  @override
  Widget build(BuildContext context) {
    return YgOverlayRenderWidget(
      children: <Widget>[
        widget.child,
        ..._entries,
      ],
    );
  }

  // ignore: prefer-widget-private-members
  void addEntry(YgOverlayPortalFollower entry) {
    if (_entries.add(entry)) {
      setState(() {});
    }
  }

  // ignore: prefer-widget-private-members
  void removeEntry(YgOverlayPortalFollower entry) {
    if (_entries.remove(entry)) {
      setState(() {});
    }
  }
}
