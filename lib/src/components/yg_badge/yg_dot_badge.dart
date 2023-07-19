import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

/// A dot-shaped badge with a fixed size.
class YgDotBadge extends StatelessWidget {
  const YgDotBadge({super.key});

  /// The size of the dot badge.
  static const double badgeSize = 8.0;

  @override
  Widget build(BuildContext context) {
    final YgBadgeTheme badgeTheme = context.badgeTheme;

    return Container(
      width: badgeSize,
      height: badgeSize,
      decoration: BoxDecoration(
        color: badgeTheme.strongColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
