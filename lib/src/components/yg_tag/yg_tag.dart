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

  // region Leading icon
  factory YgTag.leadingIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus,
    Clip clipBehavior,
    required YgIcon icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) = _YgTagWithLeadingIcon;
  // endregion Leading icon

  // region Trailing icon
  factory YgTag.trailingIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus,
    Clip clipBehavior,
    required YgIcon icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) = _YgTagWithTrailingIcon;
  // endregion Trailing icon

  // region Double icon
  factory YgTag.doubleIcon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus,
    Clip clipBehavior,
    required YgIcon leadingIcon,
    required YgIcon trailingIcon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) = _YgTagWithDoubleIcon;
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
class _YgTagWithLeadingIcon extends YgTag {
  _YgTagWithLeadingIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    required YgIcon icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) : super(
          child: _YgTagWithLeadingIconChild(
            icon: icon,
            child: child,
          ),
          variant: variant,
          size: size,
          weight: weight,
        );
}

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
        icon.copyWith(size: YgIconSize.small),
        SizedBox(width: context.tagTheme.iconSpacing),
        Flexible(child: child),
      ],
    );
  }
}
// endregion Leading icon

// region Trailing icon
class _YgTagWithTrailingIcon extends YgTag {
  _YgTagWithTrailingIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    required YgIcon icon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) : super(
          child: _YgTagWithTrailingIconChild(
            icon: icon,
            child: child,
          ),
          variant: variant,
          size: size,
          weight: weight,
        );
}

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
        SizedBox(width: context.tagTheme.iconSpacing),
        icon.copyWith(size: YgIconSize.small),
      ],
    );
  }
}
// endregion Trailing icon

// region Double icon
class _YgTagWithDoubleIcon extends YgTag {
  _YgTagWithDoubleIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    required YgIcon leadingIcon,
    required YgIcon trailingIcon,
    required Widget child,
    required YgTagVariant variant,
    required YgTagSize size,
    required YgTagWeight weight,
  }) : super(
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
        leadingIcon.copyWith(size: YgIconSize.small),
        SizedBox(width: context.tagTheme.iconSpacing),
        Flexible(child: child),
        SizedBox(width: context.tagTheme.iconSpacing),
        trailingIcon.copyWith(size: YgIconSize.small),
      ],
    );
  }
}
// endregion Double icon
