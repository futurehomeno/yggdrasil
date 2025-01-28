import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_body_controller_provider.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'controller/yg_layout_controller.dart';
import 'enums/yg_header_behavior.dart';
import 'widgets/yg_layout_render_widget.dart';

class YgLayoutRegular extends StatefulWidget {
  const YgLayoutRegular({
    super.key,
    required this.child,
    required this.appBar,
    required this.headerBehavior,
  });

  final Widget child;
  final Widget appBar;
  final YgHeaderBehavior headerBehavior;

  @override
  State<YgLayoutRegular> createState() => _YgLayoutRegularState();
}

class _YgLayoutRegularState extends State<YgLayoutRegular> with TickerProviderStateMixin {
  late final YgLayoutController _controller = YgLayoutController(vsync: this);

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
      child: YgLayoutRenderWidget(
        behavior: widget.headerBehavior,
        controller: _controller,
        headerColor: theme.backgroundColor,
        children: <Widget>[
          YgLayoutBodyControllerProvider(
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
