import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar_button/_yg_avatar_button.dart';
import 'package:yggdrasil/src/theme/avatar/avatar_theme.dart';
import 'package:yggdrasil/src/theme/avatar/extensions/avatar_stack_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAvatarStack extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgAvatarStack({
    super.key,
    required this.entries,
  });

  final List<YgAvatarStackEntry> entries;

  static const int _maxAvatars = 6;
  static const int _maxAdditional = 9;

  @override
  Widget build(BuildContext context) {
    final List<Widget> avatars = _buildAvatars();
    final YgAvatarTheme theme = context.avatarTheme;
    final YgAvatarStackTheme stackTheme = context.avatarTheme.avatarStackTheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;
        final int avatarCount = avatars.length;
        final double avatarWidth = theme.diameterSmall;
        final double negativeOffset = stackTheme.negativeOffset;
        final double preferredWidth = min(avatarWidth * avatarCount - ((avatarCount - 1) * negativeOffset), maxWidth);

        final double avatarOffset = max(
          0,
          (preferredWidth - avatarWidth) / (avatarCount - 1),
        );

        final List<Widget> positionedAvatars = <Widget>[];

        for (int i = 0; i < avatarCount; i++) {
          final Widget avatar = avatars[i];

          positionedAvatars.add(
            Positioned(left: i * avatarOffset, child: avatar),
          );
        }

        return SizedBox(
          width: preferredWidth,
          height: avatarWidth,
          child: Stack(
            children: positionedAvatars,
          ),
        );
      },
    );
  }

  List<Widget> _buildAvatars() {
    final List<Widget> avatars = <Widget>[];

    if (entries.isEmpty) {
      return avatars;
    }

    int shownAvatars = min(_maxAvatars, entries.length);

    // If there are more avatars than that can be shown the last avatar will be
    // an indicator of how many additional avatars there should be.
    if (shownAvatars < entries.length) {
      shownAvatars--;
    }

    for (int i = 0; i < shownAvatars; i++) {
      final YgAvatarStackEntry entry = entries[i];

      avatars.add(
        YgAvatarButton(
          text: _getInitial(entry.name),
          size: YgAvatarSize.small,
          variant: YgAvatarButtonVariant.person,
          image: entry.image,
        ),
      );
    }

    if (entries.length > _maxAvatars) {
      final int additional = entries.length - (_maxAvatars - 1);

      avatars.add(
        YgAvatarButton(
          text: additional > _maxAdditional ? '9+' : additional.toString(),
          size: YgAvatarSize.small,
          variant: YgAvatarButtonVariant.person,
        ),
      );
    }

    return avatars;
  }

  String _getInitial(String name) {
    return name.isEmpty ? '?' : name[0].toUpperCase();
  }
}
