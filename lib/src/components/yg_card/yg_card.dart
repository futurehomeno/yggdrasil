import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Yggdrasil card component.
///
/// Simplified stateless version of [Card] from Material Design.
///
/// By design, this card does not have any padding.
// TODO(bjhandeland): Make this component stateful or make a stateful card.
// TODO(bjhandeland): Add support for semanticContainer.
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
    final YgCardTheme cardTheme = context.cardTheme;

    return Material(
      type: MaterialType.card,
      color: variant.getBackgroundColor(cardTheme),
      shape: variant.getShape(cardTheme),
      elevation: variant.getElevation(cardTheme),
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
