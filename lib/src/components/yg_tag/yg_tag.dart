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
    required super.child,
    this.size = YgTagSize.medium,
    this.variant = YgTagVariant.neutral,
    this.weight = YgTagWeight.weak,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.onPressed,
    super.statesController,
    super.style,
  });

  // region Leading icon
  YgTag.leadingIcon({
    Key? key,
    required YgIcon icon,
    required Widget child,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    ButtonStyle? style,
    FocusNode? focusNode,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    YgTagSize size = YgTagSize.medium,
    YgTagVariant variant = YgTagVariant.neutral,
    YgTagWeight weight = YgTagWeight.weak,
  }) : this(
          key: key,
          child: _YgTagWithLeadingIconChild(
            icon: icon,
            child: child,
          ),
          autofocus: autofocus,
          style: style,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          onPressed: onPressed,
          onLongPress: onLongPress,
          size: size,
          variant: variant,
        );
  // endregion Leading icon

  // region Trailing icon
  YgTag.trailingIcon({
    Key? key,
    required YgIcon icon,
    required Widget child,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    ButtonStyle? style,
    FocusNode? focusNode,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    YgTagSize size = YgTagSize.medium,
    YgTagVariant variant = YgTagVariant.neutral,
    YgTagWeight weight = YgTagWeight.weak,
  }) : this(
          key: key,
          child: _YgTagWithTrailingIconChild(
            icon: icon,
            child: child,
          ),
          autofocus: autofocus,
          style: style,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          onPressed: onPressed,
          onLongPress: onLongPress,
          size: size,
          variant: variant,
        );
  // endregion Trailing icon

  // region Double icon
  YgTag.doubleIcon({
    Key? key,
    required YgIcon leadingIcon,
    required YgIcon trailingIcon,
    required Widget child,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    ButtonStyle? style,
    FocusNode? focusNode,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    YgTagSize size = YgTagSize.medium,
    YgTagVariant variant = YgTagVariant.neutral,
    YgTagWeight weight = YgTagWeight.weak,
  }) : this(
          key: key,
          child: _YgTagWithDoubleIconChild(
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            child: child,
          ),
          autofocus: autofocus,
          style: style,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          onPressed: onPressed,
          onLongPress: onLongPress,
          size: size,
          variant: variant,
        );
  // endregion Double icon

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

// region Leading icon
class _YgTagWithLeadingIconChild extends StatelessWidget {
  const _YgTagWithLeadingIconChild({
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
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
// endregion Leading icon

// region Trailing icon
class _YgTagWithTrailingIconChild extends StatelessWidget {
  const _YgTagWithTrailingIconChild({
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
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
// endregion Trailing icon

// region Double icon
class _YgTagWithDoubleIconChild extends StatelessWidget {
  const _YgTagWithDoubleIconChild({
    required this.leadingIcon,
    required this.trailingIcon,
    required this.child,
  });

  final YgIcon leadingIcon;
  final YgIcon trailingIcon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        leadingIcon,
        Flexible(child: child),
        trailingIcon,
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
// endregion Double icon
