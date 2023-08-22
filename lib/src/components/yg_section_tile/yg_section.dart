import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Section that adds left and right padding.
class YgSection extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgSection({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.sectionTheme.padding,
      child: child,
    );
  }
}
