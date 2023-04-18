import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'enums/_enums.dart';
import 'yg_tag_style.dart';

/// Base class for creating all Yg buttons.
class YgTag extends ButtonStyleButton {
  const YgTag({
    super.key,
    required this.variant,
    this.size = YgTagSize.medium,
    this.impact = YgTagImpact.weak,
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

  factory YgTag.leftIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required Widget icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagImpact impact,
  }) = _YgTagWithLeftIcon;

  factory YgTag.rightIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required Widget icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagImpact impact,
  }) = _YgTagWithRightIcon;

  final YgTagVariant variant;
  final YgTagSize size;
  final YgTagImpact impact;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return YgTagStyle.fromVariant(
      context: context,
      variant: variant,
      size: size,
      impact: impact,
    ).toButtonStyle();
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    // We do not use themes this way.
    return null;
  }
}

class _YgTagWithRightIcon extends YgTag {
  _YgTagWithRightIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required Widget icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagImpact impact,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _YgTagWithRightIconChild(icon: icon, child: child),
          variant: variant,
          size: size,
          impact: impact,
        );
}

class _YgTagWithRightIconChild extends StatelessWidget {
  const _YgTagWithRightIconChild({
    required this.child,
    required this.icon,
  });

  final Widget child;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: child),
        SizedBox(width: context.buttonThemes.iconSpacing),
        icon,
      ],
    );
  }
}

class _YgTagWithLeftIcon extends YgTag {
  _YgTagWithLeftIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required Widget icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagImpact impact,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _YgTagWithLeftIconChild(icon: icon, child: child),
          variant: variant,
          size: size,
          impact: impact,
        );
}

class _YgTagWithLeftIconChild extends StatelessWidget {
  const _YgTagWithLeftIconChild({
    required this.child,
    required this.icon,
  });

  final Widget child;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        icon,
        SizedBox(width: context.buttonThemes.iconSpacing),
        Flexible(child: child),
      ],
    );
  }
}
