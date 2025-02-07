import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller_provider.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_internal/yg_layout_internal.dart';

import 'controller/yg_layout_header_controller.dart';
import 'enums/yg_header_behavior.dart';

class YgLayoutRegular extends StatefulWidget {
  const YgLayoutRegular({
    super.key,
    required this.child,
    this.appBar,
    this.trailing,
    this.headerBehavior = YgHeaderBehavior.fixed,
  });

  final Widget child;
  final Widget? appBar;
  final YgHeaderBehavior headerBehavior;
  final Widget? trailing;

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
      controller: _controller,
      headerBehavior: widget.headerBehavior,
      appBar: widget.appBar,
      trailing: widget.trailing,
      content: YgLayoutHeaderControllerProvider(
        controller: _controller,
        index: 0,
        child: widget.child,
      ),
    );
  }
}
