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

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 50.0),
      child: Material(
        textStyle: style.textStyle,
        color: style.backgroundColor,
        shape: style.shape,
        child: InkWell(
          onTap: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          customBorder: style.shape,
          child: Align(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}

enum YgButtonVariant {
  primary,
  secondary,
  text,
  link,
  critical;
}
