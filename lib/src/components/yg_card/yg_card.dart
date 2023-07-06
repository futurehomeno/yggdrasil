import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgCard extends StatelessWidget {
  const YgCard({
    super.key,
    this.variant = YgCardVariant.elevated,
    this.child,
  });

  /// The card's variant.
  final YgCardVariant variant;

  /// The contents of the card.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final YgCardTheme theme = context.cardTheme;

    return Container(
      margin: EdgeInsets.only(
        bottom: theme.verticalCardMargin,
      ),
      child: Material(
        type: MaterialType.card,
        color: variant.getBackgroundColor(theme),
        shape: variant.getShape(theme),
        elevation: variant.getElevation(theme),
        borderOnForeground: false,
        child: child,
      ),
    );
  }
}
