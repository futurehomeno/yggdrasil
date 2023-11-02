import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_tag_state.dart';
import 'yg_tag_style.dart';

part 'yg_tag_with_double_icon.dart';
part 'yg_tag_with_leading_icon.dart';
part 'yg_tag_with_trailing_icon.dart';

/// Base class for creating all [YgTag]s.
///
/// Tags are based on [ButtonStyleButton] and [ButtonStyle]
/// as the style is practically the same.
class YgTag extends YgButtonBase<YgTagState> {
  const YgTag({
    super.key,
    required this.child,
    super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    this.size = YgTagSize.medium,
    this.variant = YgTagVariant.neutral,
    this.weight = YgTagWeight.weak,
  });

  // region Leading icon
  const factory YgTag.leadingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgIcon icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    void Function()? onPressed,
    YgTagSize size,
    YgTagVariant variant,
    YgTagWeight weight,
  }) = _YgTagWithLeadingIcon;
  // endregion Leading icon

  // region Trailing icon
  const factory YgTag.trailingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgIcon icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    void Function()? onPressed,
    YgTagSize size,
    YgTagVariant variant,
    YgTagWeight weight,
  }) = _YgTagWithTrailingIcon;

  // endregion Trailing icon

  // region Double icon
  const factory YgTag.doubleIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    Key? key,
    required YgIcon leadingIcon,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    void Function()? onPressed,
    YgTagSize size,
    required YgIcon trailingIcon,
    YgTagVariant variant,
    YgTagWeight weight,
  }) = _YgTagWithDoubleIcon;
  // endregion Double icon

  final YgTagVariant variant;
  final YgTagSize size;
  final YgTagWeight weight;
  final Widget child;

  @override
  YgTagState createButtonState() {
    return YgTagState(
      size: size,
      variant: variant,
      weight: weight,
    );
  }

  @override
  void updateState(YgTagState state) {
    state.variant.value = variant;
    state.weight.value = weight;
    state.size.value = size;
  }

  @override
  YgButtonBaseStyle<YgTagState> createStyle(YgVsync vsync, YgTagState state) {
    return YgTagStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return child;
  }
}
