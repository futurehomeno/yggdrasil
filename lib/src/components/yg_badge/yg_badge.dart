import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

enum YgBadgeWeight {
  weak,
  strong,
}

class YgBadge extends StatelessWidget {
  const YgBadge({
    super.key,
    required this.amount,
    required this.child,
    this.weight = YgBadgeWeight.weak,
    this.alignment = Alignment.topRight,
  });

  final int amount;
  final Widget child;
  final YgBadgeWeight weight;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final YgBadgeTheme theme = context.badgeTheme;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Align(
            alignment: alignment,
            child: Container(
              padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
              decoration: BoxDecoration(
                color: _getBadgeColor(theme),
                borderRadius: theme.borderRadius,
              ),
              child: Text(
                amount > 9 ? '9+' : amount.toString(),
                style: _getTextStyle(theme),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }

  Color _getBadgeColor(YgBadgeTheme theme) {
    switch (weight) {
      case YgBadgeWeight.weak:
        return theme.weakColor;
      case YgBadgeWeight.strong:
        return theme.strongColor;
    }
  }

  TextStyle _getTextStyle(YgBadgeTheme theme) {
    switch (weight) {
      case YgBadgeWeight.weak:
        return theme.weakTextStyle;
      case YgBadgeWeight.strong:
        return theme.strongTextStyle;
    }
  }
}
