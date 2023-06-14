import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'enums/_enums.dart';

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

    return Center(
      child: Stack(
        alignment: alignment,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
            decoration: BoxDecoration(
              color: weight.getBadgeColor(theme),
              borderRadius: theme.borderRadius,
            ),
            child: Text(
              amount > 9 ? '9+' : amount.toString(),
              style: weight.getTextStyle(theme),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
