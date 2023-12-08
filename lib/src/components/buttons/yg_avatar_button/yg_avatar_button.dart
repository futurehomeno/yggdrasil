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
    required this.text,
    required this.size,
    required this.variant,
    this.image,
    super.autofocus,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.onPressed,
  });

  final YgAvatarSize size;
  final YgAvatarButtonVariant variant;
  final String text;
  final Widget? image;

  @override
  Widget buildChild(BuildContext context) {
    if (image != null) {
      return const SizedBox();
    }

    return Text(
      text,
    );
  }

  @override
  Widget? buildBackground(BuildContext context) {
    return image;
  }

  @override
  YgAvatarButtonState createButtonState() {
    return YgAvatarButtonState(
      disabled: disabled,
      image: image != null,
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
    state.image.value = image != null;
    state.size.value = size;
    state.variant.value = variant;
  }
}
