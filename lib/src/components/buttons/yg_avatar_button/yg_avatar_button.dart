import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar_button/yg_avatar_button_style.dart';
import 'package:yggdrasil/src/utils/yg_states/interfaces/yg_vsync.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'enums/_enums.dart';
import 'yg_avatar_button_state.dart';

class YgAvatarButton extends YgButtonBase<YgAvatarButtonState> {
  const YgAvatarButton({
    super.key,
    required super.autofocus,
    required super.focusNode,
    required super.onFocusChange,
    required super.onHover,
    required super.onLongPress,
    required super.onPressed,
    required this.name,
    required this.size,
    required this.variant,
    required this.child,
  });

  final YgAvatarSize size;
  final YgAvatarButtonVariant variant;
  final String name;
  final Widget? child;

  @override
  Widget buildChild(BuildContext context) {
    final Widget? child = this.child;

    if (child != null) {
      return child;
    }

    return Text(
      name.isEmpty ? '?' : name[0].toUpperCase(),
    );
  }

  @override
  YgAvatarButtonState createButtonState() {
    return YgAvatarButtonState(
      disabled: disabled,
      image: child != null,
      size: size,
      variant: variant,
    );
  }

  @override
  YgButtonBaseStyle<YgAvatarButtonState> createStyle(YgVsync vsync, YgAvatarButtonState state) {
    return YgAvatarButtonStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  void updateState(YgAvatarButtonState state) {
    state.disabled.value = disabled;
    state.image.value = child != null;
    state.size.value = size;
    state.variant.value = variant;
  }
}
