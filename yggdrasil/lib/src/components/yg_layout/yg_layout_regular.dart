import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'widgets/yg_layout_render_widget.dart';

class YgLayoutRegular extends StatefulWidget {
  const YgLayoutRegular({
    super.key,
    required this.child,
    required this.appBar,
  });

  final Widget child;
  final Widget appBar;

  @override
  State<YgLayoutRegular> createState() => _YgLayoutRegularState();
}

class _YgLayoutRegularState extends State<YgLayoutRegular> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this);

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
        headerTranslation: _controller,
        onAppBarSize: _handleSizeChange,
        children: <Widget>[
          widget.child,
          widget.appBar,
        ],
      ),
    );
  }

  void _handleSizeChange(Size size) {}
}
