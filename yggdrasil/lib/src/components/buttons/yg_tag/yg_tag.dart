import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_tag_state.dart';
import 'yg_tag_style.dart';

part 'yg_tag_with_double_icon.dart';
part 'yg_tag_with_leading_icon.dart';
part 'yg_tag_with_trailing_icon.dart';

/// The implementation of YgTag.
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

  /// YgTag with a leading icon.
  const factory YgTag.leadingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgColorableIconData icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    void Function()? onPressed,
    YgTagSize size,
    YgTagVariant variant,
    YgTagWeight weight,
  }) = _YgTagWithLeadingIcon;

  /// YgTag with a trailing icon.
  const factory YgTag.trailingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgColorableIconData icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    void Function()? onPressed,
    YgTagSize size,
    YgTagVariant variant,
    YgTagWeight weight,
  }) = _YgTagWithTrailingIcon;

  /// YgTag with a leading and trailing icon.
  const factory YgTag.doubleIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    Key? key,
    required YgColorableIconData leadingIcon,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    void Function()? onPressed,
    YgTagSize size,
    required YgColorableIconData trailingIcon,
    YgTagVariant variant,
    YgTagWeight weight,
  }) = _YgTagWithDoubleIcon;

  /// The size of the YgTag.
  final YgTagSize size;

  /// The variant of the YgTag.
  final YgTagVariant variant;

  /// The weight of the YgTag.
  final YgTagWeight weight;

  /// The child widget of the YgTag.
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
