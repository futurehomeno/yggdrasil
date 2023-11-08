import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_icon_button_style.dart';

/// Base class for creating all YgIconButtons.
class YgIconButton extends ButtonStyleButton with StatefulWidgetDebugMixin {
  YgIconButton({
    super.key,
    required YgColorableIconData icon,
    required super.onPressed,
    this.size = YgIconButtonSize.medium,
    this.variant = YgIconButtonVariant.standard,
    this.iconColor,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.statesController,
    super.style,
  }) : super(
          child: YgIcon(
            icon,
            color: iconColor,
          ),
        );

  final YgIconButtonVariant variant;
  final YgIconButtonSize size;
  final Color? iconColor;

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
