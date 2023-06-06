import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgDotIndicator extends StatelessWidget {
  const YgDotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final YgDotIndicatorTheme theme = context.dotIndicatorTheme;

    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: theme.borderRadius,
        color: theme.color,
      ),
    );
  }
}
