import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Convenience widget for column inside a SectionTile.
class YgSectionColumn extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgSectionColumn({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
  });

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return YgSection(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      ),
    );
  }
}
