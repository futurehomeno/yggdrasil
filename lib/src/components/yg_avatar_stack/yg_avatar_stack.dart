import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/avatar/avatar_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// The implementation of the Yggdrasil Avatar Stack.
class YgAvatarStack extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgAvatarStack({
    super.key,
    required this.entries,
  });

  /// Entries shown in the avatar stack as avatars.
  ///
  /// When there are more entries than the [_maxAvatars], the last visible entry
  /// will be replaced with a entry that shows the amount of hidden avatar
  /// entries.
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
        final double avatarDiameter = theme.diameterSmall;
        final double maxStackWidth = constraints.maxWidth;

        if (avatars.length == 1) {
          return SizedBox.square(
            dimension: min(maxStackWidth, avatarDiameter),
            child: avatars.first,
          );
        }

        final int totalAvatars = avatars.length;
        final double overlapDistance = theme.avatarStackTheme.overlapDistance;
        final double optimalOffset = avatarDiameter - overlapDistance;
        final double optimalWidth = (optimalOffset * totalAvatars) + overlapDistance;
        final double stackWidth = min(optimalWidth, constraints.maxWidth);
        final double actualOffset = (stackWidth - avatarDiameter) / (totalAvatars - 1);

        return SizedBox(
          width: stackWidth,
          height: min(avatarDiameter, stackWidth),
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

    final int shownEntryCount = min(_maxAvatars, entries.length);
    final List<YgAvatarStackEntry> shownEntries = entries.sublist(0, shownEntryCount);

    if (shownEntryCount < entries.length) {
      const int lastIndex = _maxAvatars - 1;
      final int additional = entries.length - lastIndex;

      shownEntries[lastIndex] = YgAvatarStackEntry(
        initials: additional > _maxAdditional ? '9+' : additional.toString(),
      );
    }

    for (final YgAvatarStackEntry entry in shownEntries) {
      avatars.add(
        YgAvatar(
          initials: entry.initials,
          size: YgAvatarSize.small,
          variant: YgAvatarVariant.person,
          image: entry.image,
        ),
      );
    }

    return avatars;
  }
}
