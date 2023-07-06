import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgDotBadge extends StatelessWidget {
  const YgDotBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final YgBadgeThemes badgeTheme = context.badgeThemes;

    return Center(
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: badgeTheme.borderRadius,
          color: badgeTheme.strongColor,
        ),
      ),
    );
  }
}
