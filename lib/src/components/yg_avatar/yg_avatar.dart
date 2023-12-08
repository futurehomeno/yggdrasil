import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar_button/_yg_avatar_button.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_person_avatar.dart';

class YgAvatar extends StatelessWidget {
  const factory YgAvatar({
    Key? key,
    required String name,
    ValueChanged<bool>? onFocusChange,
    ValueChanged<bool>? onHover,
    VoidCallback? onLongPress,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    YgIcon? badge,
    YgAvatarSize size,
    bool autofocus,
    Widget? image,
  }) = _YgPersonAvatar;

  const YgAvatar.company({
    super.key,
    required this.name,
    this.image,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.size = YgAvatarSize.medium,
    this.autofocus = false,
  });

  /// Called when the user presses the button.
  final VoidCallback? onPressed;

  /// Called when the user long presses the button.
  final VoidCallback? onLongPress;

  /// Called when the user hovers over the button.
  final ValueChanged<bool>? onHover;

  /// Called when the user focuses the button.
  final ValueChanged<bool>? onFocusChange;

  /// The [FocusNode] in charge of managing focus for this button.
  final FocusNode? focusNode;

  /// Whether the button should focus on first build.
  final bool autofocus;

  /// The size of the avatar.
  final YgAvatarSize size;

  /// The name of which the initials will be shown in the avatar.
  ///
  /// If image is provided the initials will be hidden.
  final String name;

  /// The image shown in the avatar.
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    final YgAvatarTheme theme = context.avatarTheme;
    final String initials = name.isEmpty ? '?' : name[0].toUpperCase();

    return Padding(
      padding: theme.padding,
      child: YgAvatarButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        focusNode: focusNode,
        autofocus: autofocus,
        size: size,
        text: initials,
        variant: _variant,
        image: image,
      ),
    );
  }

  YgAvatarButtonVariant get _variant => YgAvatarButtonVariant.company;
}
