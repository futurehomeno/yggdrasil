import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/progress_indicator/extensions/_extensions.dart';

class YgLinearProgressIndicator extends StatelessWidget {
  const YgLinearProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final YgProgressIndicatorTheme indicatorTheme = context.progressIndicatorTheme;
    final LinearProgressIndicatorTheme theme = indicatorTheme.linearProgressIndicatorTheme;

    return ClipRRect(
      borderRadius: theme.borderRadius,
      child: SizedBox(
        height: theme.height,
        child: LinearProgressIndicator(
          color: theme.color,
          backgroundColor: theme.backgroundColor,
        ),
      ),
    );
  }
}
