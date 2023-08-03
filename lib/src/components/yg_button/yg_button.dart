import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_button_style.dart';

/// Base class for creating all Yg buttons.
// TODO(bjhandeland): Consider making the private classes parts.
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
          child: _YgButtonWithLeadingIconChild(
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
          child: _YgButtonWithTrailingIconChild(
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

// region Leading icon

class _YgButtonWithLeadingIconChild extends StatelessWidget {
  const _YgButtonWithLeadingIconChild({
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
        icon,
        Flexible(child: child),
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}

// endregion Leading icon

// region Trailing icon

class _YgButtonWithTrailingIconChild extends StatelessWidget {
  const _YgButtonWithTrailingIconChild({
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
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}

//endregion Trailing icon
