import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// A dot-shaped badge with a fixed size.
class YgDotBadge extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgDotBadge({super.key});

  /// The size of the dot badge.
  static const double _badgeSize = 8.0;

  @override
  Widget build(BuildContext context) {
    final YgBadgeTheme badgeTheme = context.badgeTheme;

    return Container(
      width: _badgeSize,
      height: _badgeSize,
      decoration: BoxDecoration(
        color: badgeTheme.strongColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
