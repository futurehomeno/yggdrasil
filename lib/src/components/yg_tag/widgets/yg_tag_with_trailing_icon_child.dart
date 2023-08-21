import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgTagWithTrailingIconChild extends StatelessWidget {
  const YgTagWithTrailingIconChild({
    required this.icon,
    required this.child,
  });

  final YgIcon icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: child),
        icon,
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
