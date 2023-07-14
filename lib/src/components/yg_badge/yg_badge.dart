import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_badge/_yg_badge.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

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
    final YgBadgeTheme badgeTheme = context.badgeTheme;

    return Stack(
      alignment: alignment,
      children: <Widget>[
        child,
        Container(
          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
          decoration: BoxDecoration(
            color: YgBadgeMapper.getBadgeColor(
              theme: badgeTheme,
              weight: weight,
            ),
            borderRadius: badgeTheme.borderRadius,
          ),
          constraints: const BoxConstraints(
            minWidth: 20,
            minHeight: 20,
          ),
          child: Center(
            widthFactor: 1,
            child: Text(
              amount > 9 ? '9+' : amount.toString(),
              style: YgBadgeMapper.getTextStyle(
                theme: badgeTheme,
                weight: weight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
