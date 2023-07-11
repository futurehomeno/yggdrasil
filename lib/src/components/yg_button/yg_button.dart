import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'yg_button_style.dart';

/// Base class for creating all Yg buttons.
// TODO(bjhandeland): Replace icon with FhIcon after merge.
class YgButton extends ButtonStyleButton {
  const YgButton({
    super.key,
    required this.variant,
    this.size = ButtonSize.medium,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
  });

  factory YgButton.leftIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required String icon,
    required Widget child,
    required ButtonVariant variant,
    required ButtonSize size,
  }) = _YgButtonWithLeftIcon;

  factory YgButton.rightIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus,
    Clip? clipBehavior,
    required String icon,
    required Widget child,
    required ButtonVariant variant,
    required ButtonSize size,
  }) = _YgButtonWithRightIcon;

  final ButtonVariant variant;
  final ButtonSize size;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return YgButtonStyle.fromVariant(
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

class _YgButtonWithRightIcon extends YgButton {
  _YgButtonWithRightIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    super.autofocus = false,
    Clip? clipBehavior,
    required String icon,
    required Widget child,
    required ButtonVariant variant,
    required ButtonSize size,
  }) : super(
          clipBehavior: clipBehavior ?? Clip.none,
          child: _YgButtonWithRightIconChild(icon: icon, child: child),
          variant: variant,
          size: size,
        );
}

class _YgButtonWithRightIconChild extends StatelessWidget {
  const _YgButtonWithRightIconChild({
    required this.child,
    required this.icon,
  });

  final Widget child;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: child),
        SizedBox(width: context.buttonThemes.iconSpacing),
        YgIcon(icon: icon, iconSize: YgIconSize.small),
      ],
    );
  }
}

class _YgButtonWithLeftIcon extends YgButton {
  _YgButtonWithLeftIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required String icon,
    required Widget child,
    required ButtonVariant variant,
    required ButtonSize size,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _YgButtonWithLeftIconChild(icon: icon, child: child),
          variant: variant,
          size: size,
        );
}

class _YgButtonWithLeftIconChild extends StatelessWidget {
  const _YgButtonWithLeftIconChild({
    required this.child,
    required this.icon,
  });

  final Widget child;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        YgIcon(icon: icon, iconSize: YgIconSize.small),
        SizedBox(width: context.buttonThemes.iconSpacing),
        Flexible(child: child),
      ],
    );
  }
}
