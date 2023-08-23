import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_tag_style.dart';

part 'yg_tag_with_double_icon_child.dart';
part 'yg_tag_with_leading_icon_child.dart';
part 'yg_tag_with_trailing_icon_child.dart';

/// Base class for creating all [YgTag]s.
///
/// Tags are based on [ButtonStyleButton] and [ButtonStyle]
/// as the style is practically the same.
class YgTag extends ButtonStyleButton with StatefulWidgetDebugMixin {
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
    super.key,
    required YgIcon icon,
    required Widget child,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.style,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onPressed,
    super.onLongPress,
    this.size = YgTagSize.medium,
    this.variant = YgTagVariant.neutral,
    this.weight = YgTagWeight.weak,
  }) : super(
          child: YgTagWithLeadingIconChild(
            icon: icon,
            child: child,
          ),
        );
  // endregion Leading icon

  // region Trailing icon
  YgTag.trailingIcon({
    super.key,
    required YgIcon icon,
    required Widget child,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.style,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onPressed,
    super.onLongPress,
    this.size = YgTagSize.medium,
    this.variant = YgTagVariant.neutral,
    this.weight = YgTagWeight.weak,
  }) : super(
          child: YgTagWithTrailingIconChild(
            icon: icon,
            child: child,
          ),
        );
  // endregion Trailing icon

  // region Double icon
  YgTag.doubleIcon({
    super.key,
    required YgIcon leadingIcon,
    required YgIcon trailingIcon,
    required Widget child,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.style,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onPressed,
    super.onLongPress,
    this.size = YgTagSize.medium,
    this.variant = YgTagVariant.neutral,
    this.weight = YgTagWeight.weak,
  }) : super(
          child: YgTagWithDoubleIconChild(
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            child: child,
          ),
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
