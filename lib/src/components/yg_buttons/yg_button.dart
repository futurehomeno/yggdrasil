import 'package:flutter/material.dart';

import 'yg_button_style.dart';

abstract class YgButton extends StatelessWidget {
  const YgButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    required this.child,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final Widget child;

  @protected
  YgButtonStyle defaultStyleOf(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final YgButtonStyle style = defaultStyleOf(context);

    return Material(
      textStyle: style.textStyle,
      color: style.backgroundColor,
      shape: style.shape,
      child: InkWell(
        onTap: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        customBorder: style.shape,
        child: Padding(
          padding: style.padding,
          child: child,
        ),
      ),
    );
  }
}
