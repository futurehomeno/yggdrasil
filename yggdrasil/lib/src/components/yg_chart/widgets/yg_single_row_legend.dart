import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// A single row of legend items that scrolls horizontally on overflow.
///
/// Centered like a Wrap while the items fit: the Center makes the scroll
/// view shrink-wrap its content, so once the items overflow it fills the
/// width and scrolls instead of growing a second row. Shared by the
/// [YgChart] and [YgStateTimeline] legends so both lay out and overflow
/// identically.
class YgSingleRowLegend extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgSingleRowLegend({
    super.key,
    required this.children,
  });

  /// The legend items, laid out with the standard legend spacing.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final double spacing = context.tokens.dimensions.xxs;

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (int i = 0; i < children.length; i++) ...<Widget>[
              if (i > 0) SizedBox(width: spacing),
              children[i],
            ],
          ],
        ),
      ),
    );
  }
}
