import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_tag_style.dart';

/// Base class for creating all [YgTag]s.
///
/// Tags are based on [ButtonStyleButton] and [ButtonStyle]
/// as the style is practically the same.
class YgTag extends ButtonStyleButton {
  const YgTag({
    super.key,
    required this.variant,
    this.size = YgTagSize.medium,
    this.weight = YgTagWeight.weak,
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
    required String icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) = _YgTagWithLeftIcon;

  factory YgTag.rightIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required String icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) = _YgTagWithRightIcon;

  factory YgTag.doubleIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    required String leadingIcon,
    required String trailingIcon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) = _YgTagWithDoubleIcon;

  final YgTagVariant variant;
  final YgTagSize size;
  final YgTagWeight weight;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return YgTagStyle.fromVariant(
      context: context,
      variant: variant,
      size: size,
      weight: weight,
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
    required String icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _YgTagWithRightIconChild(icon: icon, child: child),
          variant: variant,
          size: size,
          weight: weight,
        );
}

class _YgTagWithRightIconChild extends StatelessWidget {
  const _YgTagWithRightIconChild({
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
        SizedBox(width: context.tagTheme.iconSpacing),
        YgIcon(icon: icon, iconSize: YgIconSize.smaller),
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
    required String icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _YgTagWithLeftIconChild(icon: icon, child: child),
          variant: variant,
          size: size,
          weight: weight,
        );
}

class _YgTagWithLeftIconChild extends StatelessWidget {
  const _YgTagWithLeftIconChild({
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
        YgIcon(icon: icon, iconSize: YgIconSize.smaller),
        SizedBox(width: context.tagTheme.iconSpacing),
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
    required String leadingIcon,
    required String trailingIcon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
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
          weight: weight,
        );
}

class _YgTagWithDoubleIconChild extends StatelessWidget {
  const _YgTagWithDoubleIconChild({
    required this.child,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  final Widget child;
  final String leadingIcon;
  final String trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        YgIcon(icon: leadingIcon, iconSize: YgIconSize.smaller),
        SizedBox(width: context.tagTheme.iconSpacing),
        Flexible(child: child),
        SizedBox(width: context.tagTheme.iconSpacing),
        YgIcon(icon: trailingIcon, iconSize: YgIconSize.smaller),
      ],
    );
  }
}
