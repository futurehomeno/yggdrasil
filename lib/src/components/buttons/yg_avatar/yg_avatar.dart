import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/yg_states/interfaces/yg_vsync.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_avatar_state.dart';
import 'yg_avatar_style.dart';

class YgAvatar extends YgButtonBase<YgAvatarButtonState> with StatefulWidgetDebugMixin {
  const YgAvatar({
    super.key,
    required this.initials,
    super.autofocus,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.onPressed,
    this.size = YgAvatarSize.small,
    this.variant = YgAvatarVariant.person,
    this.image,
  });

  /// The variant of the avatar.
  final YgAvatarVariant variant;

  /// The size of the avatar.
  final YgAvatarSize size;

  /// The initials shown in the widget.
  ///
  /// Should normally only show the first character of the first name.
  final String initials;

  /// The image shown in the avatar.
  final Widget? image;

  @override
  Widget buildChild(BuildContext context) {
    if (image != null) {
      return const SizedBox();
    }

    return Text(
      initials,
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
    return YgAvatarStyle(
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
