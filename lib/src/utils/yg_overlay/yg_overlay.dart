import 'package:flutter/material.dart';

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
  final Set<Widget> _entries = <Widget>{};

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
  void addEntry(Widget entry) {
    if (_entries.add(entry)) {
      setState(() {});
    }
  }

  // ignore: prefer-widget-private-members
  void removeEntry(Widget entry) {
    if (_entries.remove(entry)) {
      setState(() {});
    }
  }
}
