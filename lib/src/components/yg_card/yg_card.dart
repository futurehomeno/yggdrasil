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
    final YgCardThemes cardThemes = context.cardThemes;

    return Container(
      margin: EdgeInsets.only(
        bottom: cardThemes.verticalCardMargin,
      ),
      child: Material(
        type: MaterialType.card,
        color: variant.getBackgroundColor(cardThemes),
        shape: variant.getShape(cardThemes),
        elevation: variant.getElevation(cardThemes),
        borderOnForeground: false,
        child: child,
      ),
    );
  }
}
