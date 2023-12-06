import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/buttons/widgets/yg_button_base.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/enums/_enums.dart';

import 'yg_avatar_state.dart';

abstract class YgAvatar extends YgButtonBase<YgAvatarState> {
  const YgAvatar({
    super.key,
    required this.name,
    super.autofocus,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.onPressed,
    this.image,
    this.size = YgAvatarSize.medium,
  });

  final YgAvatarSize size;
  final String name;
  final Widget? image;

  @override
  Widget buildChild(BuildContext context) {
    final Widget? image = this.image;

    if (image != null) {
      return image;
    }

    return Text(
      name.isEmpty ? '?' : name[0].toUpperCase(),
    );
  }
}
