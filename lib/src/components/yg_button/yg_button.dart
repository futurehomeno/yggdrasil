import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_button_style.dart';

/// Base class for creating all Yg buttons.
// TODO(bjhandeland): Consider making the private classes parts.
class YgButton extends ButtonStyleButton with StatefulWidgetDebugMixin {
  const YgButton({
    super.key,
    required this.variant,
    required super.onPressed,
    required super.child,
    this.size = YgButtonSize.medium,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
  });

  // region Leading icon
  factory YgButton.leadingIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required YgIcon icon,
    required Widget child,
    required YgButtonVariant variant,
    required YgButtonSize size,
  }) = _YgButtonWithLeadingIcon;

  // endregion Leading icon

  // region Trailing icon
  factory YgButton.trailingIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus,
    Clip? clipBehavior,
    required YgIcon icon,
    required Widget child,
    required YgButtonVariant variant,
    required YgButtonSize size,
  }) = _YgButtonWithTrailingIcon;

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

class _YgButtonWithLeadingIcon extends YgButton {
  _YgButtonWithLeadingIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required YgIcon icon,
    required Widget child,
    required YgButtonVariant variant,
    required YgButtonSize size,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _YgButtonWithLeadingIconChild(
            icon: icon,
            child: child,
          ),
          variant: variant,
          size: size,
        );
}

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
        icon.copyWith(size: YgIconSize.small),
        Flexible(child: child),
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}

// endregion Leading icon

// region Trailing icon

class _YgButtonWithTrailingIcon extends YgButton {
  _YgButtonWithTrailingIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    super.autofocus = false,
    Clip? clipBehavior,
    required YgIcon icon,
    required Widget child,
    required YgButtonVariant variant,
    required YgButtonSize size,
  }) : super(
          clipBehavior: clipBehavior ?? Clip.none,
          child: _YgButtonWithTrailingIconChild(
            icon: icon,
            child: child,
          ),
          variant: variant,
          size: size,
        );
}

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
        icon.copyWith(size: YgIconSize.small),
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}

//endregion Trailing icon
