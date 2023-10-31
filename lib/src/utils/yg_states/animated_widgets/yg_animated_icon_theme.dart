import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

class YgAnimatedIconTheme extends StatelessWidget {
  const YgAnimatedIconTheme({
    super.key,
    required this.iconTheme,
    required this.child,
  });

  final YgDrivenIconThemeDataProperty iconTheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: iconTheme,
      builder: (BuildContext context, _) {
        return IconTheme(
          data: iconTheme.value,
          child: child,
        );
      },
    );
  }
}
