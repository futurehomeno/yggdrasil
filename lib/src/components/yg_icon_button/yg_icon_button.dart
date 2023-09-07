import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_icon_button_style.dart';

/// Base class for creating all YgIconButtons.
class YgIconButton extends ButtonStyleButton with StatefulWidgetDebugMixin {
  const YgIconButton({
    super.key,
    required YgIcon child,
    required super.onPressed,
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
  }) : super(child: child);

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

  @override
  YgDebugType get debugType {
    if (onPressed == null) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}
