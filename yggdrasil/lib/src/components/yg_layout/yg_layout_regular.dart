import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller_provider.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'controller/yg_layout_header_controller.dart';
import 'enums/yg_header_behavior.dart';
import 'widgets/layout_header_renderer/_layout_renderer.dart';

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
    final YgLayoutTheme theme = context.layoutTheme;

    return Material(
      color: theme.backgroundColor,
      child: YgLayoutHeaderRenderWidget(
        behavior: widget.headerBehavior,
        controller: _controller,
        headerColor: theme.backgroundColor,
        children: <Widget>[
          YgLayoutHeaderControllerProvider(
            controller: _controller,
            index: 0,
            child: widget.child,
          ),
          widget.appBar,
        ],
      ),
    );
  }
}
