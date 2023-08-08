import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgLinearProgressIndicator extends StatelessWidget {
  const YgLinearProgressIndicator({
    required this.value,
    super.key,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    final YgProgressIndicatorTheme theme = context.progressIndicatorTheme;

    return Material(
      borderRadius: theme.linearProgressIndicatorTheme.borderRadius,
      child: SizedBox(
        height: theme.linearProgressIndicatorTheme.height,
        child: LinearProgressIndicator(
          value: value,
          color: theme.linearProgressIndicatorTheme.activeColor,
          backgroundColor: theme.linearProgressIndicatorTheme.backgroundColor,
        ),
      ),
    );
  }
}
