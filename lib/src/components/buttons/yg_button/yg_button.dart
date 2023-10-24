import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';

class YgButton extends StatelessWidget {
  const YgButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return YgBaseButton(
      createStyle: createStyle,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      focusNode: focusNode,
      autofocus: autofocus,
      child: buildChild(context),
    );
  }

  _createStyle() {}

  Widget buildChild(BuildContext context) {}
}

class _YgButtonWithLeadingIconChild extends YgButton {}

class _YgButtonWithTrailingIconChild extends YgButton {}
