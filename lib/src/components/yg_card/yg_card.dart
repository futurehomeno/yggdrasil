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
      color: YgCardVariantMapper.getBackgroundColor(
        theme: cardTheme,
        variant: variant,
      ),
      shape: YgCardVariantMapper.getShape(
        theme: cardTheme,
        variant: variant,
      ),
      elevation: YgCardVariantMapper.getElevation(
        theme: cardTheme,
        variant: variant,
      ),
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
