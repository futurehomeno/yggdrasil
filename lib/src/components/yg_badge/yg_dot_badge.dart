import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgDotBadge extends StatelessWidget {
  const YgDotBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final YgBadgeTheme theme = context.badgeTheme;

    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: theme.borderRadius,
        color: theme.strongColor,
      ),
    );
  }
}
