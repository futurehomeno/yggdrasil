import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/avatar/avatar_theme.dart';
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
    if (entries.isEmpty) {
      return const SizedBox();
    }

    final List<Widget> avatars = _buildAvatars();
    final YgAvatarTheme theme = context.avatarTheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int totalAvatars = avatars.length;
        final double avatarDiameter = theme.diameterSmall;
        final double overlapDistance = theme.avatarStackTheme.overlapDistance;
        final double optimalOffset = avatarDiameter - overlapDistance;
        final double optimalWidth = (optimalOffset * totalAvatars);
        final double stackWidth = min(optimalWidth, constraints.maxWidth - overlapDistance);
        final double actualOffset = max(stackWidth / totalAvatars, 0);

        return SizedBox(
          width: stackWidth + overlapDistance,
          height: avatarDiameter,
          child: Stack(
            children: List<Widget>.generate(
              totalAvatars,
              (int index) => Positioned(
                left: index * actualOffset,
                child: avatars[index],
              ),
            ),
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
        YgAvatar(
          initials: _getInitial(entry.name),
          size: YgAvatarSize.small,
          variant: YgAvatarVariant.person,
          image: entry.image,
        ),
      );
    }

    if (entries.length > _maxAvatars) {
      final int additional = entries.length - (_maxAvatars - 1);

      avatars.add(
        YgAvatar(
          initials: additional > _maxAdditional ? '9+' : additional.toString(),
          size: YgAvatarSize.small,
          variant: YgAvatarVariant.person,
        ),
      );
    }

    return avatars;
  }

  String _getInitial(String name) {
    return name.isEmpty ? '?' : name[0].toUpperCase();
  }
}
