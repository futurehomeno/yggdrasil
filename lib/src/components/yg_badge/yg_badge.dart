import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'enums/_enums.dart';

/// [YgBadge] takes a child widget and overlays it with a badge.
class YgBadge extends StatelessWidget {
  const YgBadge({
    super.key,
    required this.amount,
    required this.child,
    this.weight = YgBadgeWeight.weak,
    this.alignment = Alignment.topRight,
  });

  /// The amount of items the badge should show.
  final int amount;

  /// The child widget that the badge should show up on.
  final Widget child;

  /// The weight of the badge text style.
  final YgBadgeWeight weight;

  /// The alignment of the badge relative to the child.
  final Alignment alignment;

  static const double badgeMinSize = 20.0;
  static const int maxBadgeCount = 9;

  @override
  Widget build(BuildContext context) {
    final YgBadgeTheme badgeTheme = context.badgeTheme;

    return Stack(
      alignment: alignment,
      children: <Widget>[
        child,
        Container(
          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
          decoration: BoxDecoration(
            color: weight.getBadgeColor(badgeTheme),
            borderRadius: badgeTheme.borderRadius,
          ),
          constraints: const BoxConstraints(
            minWidth: badgeMinSize,
            minHeight: badgeMinSize,
          ),
          child: Center(
            widthFactor: 1,
            child: Text(
              amount > maxBadgeCount ? '$maxBadgeCount+' : amount.toString(),
              style: weight.getTextStyle(badgeTheme),
            ),
          ),
        ),
      ],
    );
  }
}
