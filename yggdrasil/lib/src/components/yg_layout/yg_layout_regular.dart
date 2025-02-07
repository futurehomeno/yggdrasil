import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/yg_layout_internal.dart';

import 'controller/yg_layout_header_controller.dart';
import 'enums/yg_header_behavior.dart';

class YgLayoutRegular extends StatefulWidget {
  const YgLayoutRegular({
    super.key,
    required this.child,
    required this.appBar,
    this.headerBehavior = YgHeaderBehavior.static,
  });

  final Widget child;
  final Widget appBar;
  final YgHeaderBehavior headerBehavior;

  @override
  State<YgLayoutRegular> createState() => _YgLayoutRegularState();
}

class _YgLayoutRegularState extends State<YgLayoutRegular> with TickerProviderStateMixin {
  late final YgLayoutHeaderController _controller = YgLayoutHeaderController(vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YgLayoutInternal(
      content: widget.child,
      controller: _controller,
      headerBehavior: widget.headerBehavior,
    );
  }
}
