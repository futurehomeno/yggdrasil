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
    super.onPressed,
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

  factory YgTag.doubleIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required Widget leadingIcon,
    required Widget trailingIcon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagImpact impact,
  }) = _YgTagWithDoubleIcon;

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
        SizedBox(width: context.tagThemes.iconSpacing),
        SizedBox(
          width: context.tagThemes.iconSize,
          height: context.tagThemes.iconSize,
          child: icon,
        ),
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
        SizedBox(
          width: context.tagThemes.iconSize,
          height: context.tagThemes.iconSize,
          child: icon,
        ),
        SizedBox(width: context.tagThemes.iconSpacing),
        Flexible(child: child),
      ],
    );
  }
}

class _YgTagWithDoubleIcon extends YgTag {
  _YgTagWithDoubleIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required Widget leadingIcon,
    required Widget trailingIcon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagImpact impact,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _YgTagWithDoubleIconChild(
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            child: child,
          ),
          variant: variant,
          size: size,
          impact: impact,
        );
}

class _YgTagWithDoubleIconChild extends StatelessWidget {
  const _YgTagWithDoubleIconChild({
    required this.child,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  final Widget child;
  final Widget leadingIcon;
  final Widget trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: context.tagThemes.iconSize,
          height: context.tagThemes.iconSize,
          child: leadingIcon,
        ),
        SizedBox(width: context.tagThemes.iconSpacing),
        Flexible(child: child),
        SizedBox(width: context.tagThemes.iconSpacing),
        SizedBox(
          width: context.tagThemes.iconSize,
          height: context.tagThemes.iconSize,
          child: trailingIcon,
        ),
      ],
    );
  }
}
