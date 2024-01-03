import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_overlay/yg_overlay.dart';

import 'yg_overlay_portal_controller.dart';

class YgOverlayPortal2 extends StatefulWidget {
  const YgOverlayPortal2({
    super.key,
    required this.controller,
  });

  final YgOverlayPortalController controller;
  final WidgetBuilder overlayBuilder;

  @override
  State<YgOverlayPortal2> createState() => YgOverlayPortal2State();
}

class YgOverlayPortal2State extends State<YgOverlayPortal2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  hide() {}

  void show() {
    final YgOverlayState? state = context.findAncestorStateOfType<YgOverlayState>();

    if (state == null) {
      return;
    }

    state.addEntry(widget.overlayBuilder(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
