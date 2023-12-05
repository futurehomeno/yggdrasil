import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_card/yg_card_state.dart';
import 'package:yggdrasil/src/components/yg_card/yg_card_style.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'enums/_enums.dart';

/// Yggdrasil card component.
///
/// Simplified stateless version of [Card] from Material Design.
///
/// By design, this card does not have any padding.
// TODO(bjhandeland): Make this component stateful or make a stateful card.
// TODO(bjhandeland): Add support for semanticContainer.
class YgCard extends StatefulWidget {
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
  State<YgCard> createState() => _YgCardState();
}

class _YgCardState extends StateWithYgStyle<YgCard, YgCardStyle> {
  late final YgCardState _state = YgCardState(
    variant: widget.variant,
  );

  @override
  YgCardStyle createStyle() {
    return YgCardStyle(
      state: _state,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant YgCard oldWidget) {
    _state.variant.value = widget.variant;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YgAnimatedPhysicalShape(
      shape: style.shape,
      color: style.backgroundColor,
      elevation: style.elevation,
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: widget.child,
      ),
    );
  }
}
