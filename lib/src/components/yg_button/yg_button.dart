import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_button_style.dart';

part 'yg_button_with_leading_icon_child.dart';
part 'yg_button_with_trailing_icon_child.dart';

/// Base class for creating all Yg buttons.
class YgButton extends ButtonStyleButton with StatefulWidgetDebugMixin {
  const YgButton({
    super.key,
    required super.onPressed,
    required super.child,
    this.size = YgButtonSize.medium,
    this.variant = YgButtonVariant.primary,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.statesController,
    super.style,
  });

  // region Leading icon
  YgButton.leadingIcon({
    super.key,
    required super.onPressed,
    required YgIcon icon,
    required Widget child,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    this.size = YgButtonSize.medium,
    this.variant = YgButtonVariant.primary,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.statesController,
    super.style,
  }) : super(
          child: YgButtonWithLeadingIconChild(
            icon: icon,
            child: child,
          ),
        );

  // endregion Leading icon

  // region Trailing icon
  YgButton.trailingIcon({
    super.key,
    required super.onPressed,
    required YgIcon icon,
    required Widget child,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    this.size = YgButtonSize.medium,
    this.variant = YgButtonVariant.primary,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.statesController,
    super.style,
  }) : super(
          child: YgButtonWithTrailingIconChild(
            icon: icon,
            child: child,
          ),
        );

  final YgButtonVariant variant;
  final YgButtonSize size;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return YgButtonStyle.fromVariant(
      context: context,
      variant: variant,
      size: size,
    ).toButtonStyle();
  }
  // endregion Trailing icon

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    // We do not use themes this way.
    return null;
  }
}
