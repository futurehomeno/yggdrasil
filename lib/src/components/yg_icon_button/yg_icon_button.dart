import 'package:flutter/material.dart';

import 'enums/_enums.dart';
import 'yg_icon_button_style.dart';

/// Base class for creating all YgIconButtons.
// TODO(bjhandeland): Consider making the private classes parts.
class YgIconButton extends ButtonStyleButton {
  const YgIconButton({
    super.key,
    required super.onPressed,
    required super.child,
    this.size = YgIconButtonSize.medium,
    this.variant = YgIconButtonVariant.standard,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.statesController,
    super.style,
  });

  final YgIconButtonVariant variant;
  final YgIconButtonSize size;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return YgIconButtonStyle.fromVariant(
      context: context,
      variant: variant,
      size: size,
    ).toButtonStyle();
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    // We do not use themes this way.
    return null;
  }
}
